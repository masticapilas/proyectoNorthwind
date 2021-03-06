﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using tutatu.Models;

namespace tutatu.Models
{
    public class EFwebuser
    {
        private tutatuUsa datos = new tutatuUsa();


        /// <summary>
        /// Crea un nuevo usuario de la web con todos los datos requeridos.
        /// </summary>
        /// <param name="nick"></param>
        /// <param name="pass"></param>
        /// <param name="nom"></param>
        /// <param name="ape"></param>
        /// <param name="email"></param>
        /// <param name="bday"></param>
        /// <param name="sexo"></param>
        public void crearWebUser (string nick, string pass, string nom, string ape, string email, DateTime bday, string sexo)
    {
            usuarios nuevoUser = new usuarios();
            webuser nuevo = new webuser();
            DateTime hoy = DateTime.Now;
            nuevoUser.nickname = nick;
            nuevoUser.pass1 = pass;
            nuevoUser.pass2 = pass;
            nuevoUser.date_reg = hoy;
            nuevo.fname = nom;
            nuevo.sname = ape;
            nuevo.email = email;
            nuevo.b_date = bday;
            nuevo.sexo = sexo;
            nuevoUser.webuser.Add(nuevo);
            

            try
            {
                datos.usuarios.Add(nuevoUser);
                
                
                datos.SaveChanges();
            }
            catch (Exception)
            {

                throw;
            }
            

            
    }

        /// <summary>
        /// Autentica un usuario en la web. Devuelve un 1 si el usuario se ha logueado correctamente y 0 en caso contrario.
        /// </summary>
        /// <param name="nick"></param>
        /// <param name="pass"></param>
        public short loguear (string nick, string pass, bool check)
        {
            
            
            usuarios omWebuserBD = new usuarios();

            
          
            try
            {
                omWebuserBD = (from usr in datos.usuarios where usr.nickname == nick && usr.pass1 == pass select usr).FirstOrDefault();

                if (omWebuserBD != null && omWebuserBD.pass1 == omWebuserBD.pass1)
                {
                    

                        return omWebuserBD.id_u;
           
                }
                else
                {
                    return  -1;
                    throw new Exception("no se ha encontrado ninguna coincidencia.");
                }

            }
            catch (Exception e)
            {

                throw e;
            }
            

            
    }

        /// <summary>
        /// Consigue el nombre del usuario.
        /// </summary>
        /// <param name="idu">Identificador unico del usuario</param>
        /// <returns></returns>
        public string saludo(short idu)
        {
            try
            {
                string nameGreetings = (from usr in datos.webuser where usr.id_u == idu select usr.fname).FirstOrDefault();

                return nameGreetings;

            }
            catch (Exception e)
            {

                throw e;
            }

        }

        /// <summary>
        /// Consigue un unico usuario de la bd
        /// </summary>
        /// <param name="id">Identificador unico del usuario</param>
        /// <returns></returns>
        public webuser conseguirUsuario(int id)
        {
            webuser info;

            info = (from usr in datos.webuser where usr.id_u == id select usr).SingleOrDefault();

            return info;
        }

        public void desloguear()
        {
            
        }
}
  
}