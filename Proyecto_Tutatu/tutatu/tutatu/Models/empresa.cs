//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace tutatu.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class empresa
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public empresa()
        {
            this.tatuador = new HashSet<tatuador>();
        }
    
        public short id_emp { get; set; }
        public short id_u { get; set; }
        public string name { get; set; }
        public string cif { get; set; }
        public string address { get; set; }
        public string phone { get; set; }
        public string owner { get; set; }
        public string email { get; set; }
        public string web { get; set; }
        public string services { get; set; }
        public string trayectoria { get; set; }
    
        public virtual usuarios usuarios { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tatuador> tatuador { get; set; }
    }
}
