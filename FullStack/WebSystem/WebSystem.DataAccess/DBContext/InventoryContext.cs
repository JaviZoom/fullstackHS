using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using WebSystem.Entity;

namespace WebSystem.DataAccess.DBContext;

public partial class InventoryContext : DbContext
{
    public InventoryContext()
    {
    }

    public InventoryContext(DbContextOptions<InventoryContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Item> Items { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) { }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Item>(entity =>
        {
            entity.HasKey(e => e.CodeItem);

            entity.ToTable("ITEM");

            entity.Property(e => e.CodeItem)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("CODE_ITEM");
            entity.Property(e => e.AmountItem).HasColumnName("AMOUNT_ITEM");
            entity.Property(e => e.DescriptionItem)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("DESCRIPTION_ITEM");
            entity.Property(e => e.IdItem)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID_ITEM");
            entity.Property(e => e.NameItem)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("NAME_ITEM");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
