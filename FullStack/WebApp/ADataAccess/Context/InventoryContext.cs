using System;
using System.Collections.Generic;
using ADataAccess.Models;
using Microsoft.EntityFrameworkCore;

namespace ADataAccess.Context;

public partial class InventoryContext : DbContext
{
    public InventoryContext()
    {
    }

    public InventoryContext(DbContextOptions<InventoryContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Category> Category { get; set; }

    public virtual DbSet<Item> Item { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) { }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Category>(entity =>
        {
            entity.HasKey(e => e.IdCategory);

            entity.ToTable("Category");

            entity.Property(e => e.IdCategory).HasColumnName("id_category");
            entity.Property(e => e.NameCategory)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("name_category");
        });

        modelBuilder.Entity<Item>(entity =>
        {
            entity.HasKey(e => e.IdItem);

            entity.ToTable("Item");

            entity.HasIndex(e => e.IdCategory, "RELATIONSHIP_1_FK");

            entity.Property(e => e.IdItem).HasColumnName("id_item");
            entity.Property(e => e.CodeItem)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("code_item");
            entity.Property(e => e.IdCategory).HasColumnName("id_category");
            entity.Property(e => e.NameItem)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("name_item");
            entity.Property(e => e.QuantityItem).HasColumnName("quantity_item");

            entity.HasOne(d => d.IdCategoryNavigation).WithMany(p => p.Items)
                .HasForeignKey(d => d.IdCategory)
                .HasConstraintName("FK_Item_RELATIONS_Category");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
