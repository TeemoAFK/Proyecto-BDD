﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DefuncionFetalEntities : DbContext
    {
        public DefuncionFetalEntities()
            : base("name=DefuncionFetalEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<ACTA_INSCRIPCION> ACTA_INSCRIPCION { get; set; }
        public DbSet<DEF_FETAL> DEF_FETAL { get; set; }
        public DbSet<MADRE> MADRE { get; set; }
        public DbSet<MEDICO> MEDICO { get; set; }
        public DbSet<REGISTROCIVIL> REGISTROCIVIL { get; set; }
    }
}