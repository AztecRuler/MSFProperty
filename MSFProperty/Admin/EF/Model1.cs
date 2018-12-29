namespace MSFProperty.Admin.EF
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<Blog> Blogs { get; set; }
        public virtual DbSet<PageImage> PageImages { get; set; }
        public virtual DbSet<Page> Pages { get; set; }
        public virtual DbSet<Property> Properties { get; set; }
        public virtual DbSet<TextContent> TextContents { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Blog>()
                .Property(e => e.Name)
                .IsFixedLength();

            modelBuilder.Entity<Blog>()
                .Property(e => e.Title)
                .IsFixedLength();

            modelBuilder.Entity<Blog>()
                .Property(e => e.Contents)
                .IsUnicode(false);

            modelBuilder.Entity<Blog>()
                .Property(e => e.ImageUrl)
                .IsUnicode(false);

            modelBuilder.Entity<PageImage>()
                .Property(e => e.ImageID)
                .IsFixedLength();

            modelBuilder.Entity<PageImage>()
                .Property(e => e.ImageName)
                .IsUnicode(false);

            modelBuilder.Entity<PageImage>()
                .Property(e => e.ImageUrl)
                .IsUnicode(false);

            modelBuilder.Entity<PageImage>()
                .Property(e => e.PageName)
                .IsFixedLength();

            modelBuilder.Entity<Page>()
                .Property(e => e.URL)
                .IsUnicode(false);

            modelBuilder.Entity<Property>()
                .Property(e => e.MainImage)
                .IsUnicode(false);

            modelBuilder.Entity<Property>()
                .Property(e => e.Amenities)
                .IsFixedLength();

            modelBuilder.Entity<Property>()
                .Property(e => e.BathType)
                .IsFixedLength();

            modelBuilder.Entity<Property>()
                .Property(e => e.Location)
                .IsFixedLength();

            modelBuilder.Entity<Property>()
                .Property(e => e.LocationX)
                .IsFixedLength();

            modelBuilder.Entity<Property>()
                .Property(e => e.LocationY)
                .IsFixedLength();

            modelBuilder.Entity<Property>()
                .Property(e => e.RentPrice)
                .IsFixedLength();

            modelBuilder.Entity<Property>()
                .Property(e => e.Deposit)
                .IsFixedLength();

            modelBuilder.Entity<Property>()
                .Property(e => e.AddressNumber)
                .IsFixedLength();

            modelBuilder.Entity<Property>()
                .Property(e => e.Area)
                .IsFixedLength();

            modelBuilder.Entity<Property>()
                .Property(e => e.Blurb)
                .IsFixedLength();

            modelBuilder.Entity<Property>()
                .Property(e => e.Images)
                .IsUnicode(false);

            modelBuilder.Entity<Property>()
                .Property(e => e.PropertyName)
                .IsFixedLength();

            modelBuilder.Entity<Property>()
                .Property(e => e.Street)
                .IsFixedLength();

            modelBuilder.Entity<Property>()
                .Property(e => e.Street2)
                .IsFixedLength();

            modelBuilder.Entity<Property>()
                .Property(e => e.County)
                .IsFixedLength();

            modelBuilder.Entity<Property>()
                .Property(e => e.Country)
                .IsFixedLength();

            modelBuilder.Entity<Property>()
                .Property(e => e.PostCode)
                .IsFixedLength();

            modelBuilder.Entity<TextContent>()
                .Property(e => e.PageName)
                .IsFixedLength();

            modelBuilder.Entity<TextContent>()
                .Property(e => e.ElementText)
                .IsUnicode(false);

            modelBuilder.Entity<TextContent>()
                .Property(e => e.ElementNumber)
                .IsFixedLength();

            modelBuilder.Entity<TextContent>()
                .Property(e => e.ElementType)
                .IsFixedLength();

            modelBuilder.Entity<TextContent>()
                .Property(e => e.ElementLink)
                .IsUnicode(false);
        }
    }
}
