//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProyectoBDD
{
    using System;
    using System.Collections.Generic;
    
    public partial class REGISTROCIVIL
    {
        public REGISTROCIVIL()
        {
            this.ACTA_INSCRIPCION = new HashSet<ACTA_INSCRIPCION>();
        }
    
        public int IDREGISTROCIVIL { get; set; }
        public string DIRECCIONRESGISTRO { get; set; }
        public string NOMBREREGISTRO { get; set; }
        public int OFICINAREGISTRO { get; set; }
        public string PARROQUIAREGISTRO { get; set; }
        public string CANTONREGISTRO { get; set; }
        public string PROVINCIAREGISTRO { get; set; }
    
        public virtual ICollection<ACTA_INSCRIPCION> ACTA_INSCRIPCION { get; set; }
    }
}
