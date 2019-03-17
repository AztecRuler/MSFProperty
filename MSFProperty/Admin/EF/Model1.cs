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

        public virtual DbSet<AboutUsInfo> AboutUsInfoes { get; set; }
        public virtual DbSet<Blog> Blogs { get; set; }
        public virtual DbSet<ContactDetail> ContactDetails { get; set; }
        public virtual DbSet<ContentImage> ContentImages { get; set; }
        public virtual DbSet<ErrorReporting> ErrorReportings { get; set; }
        public virtual DbSet<PageImage> PageImages { get; set; }
        public virtual DbSet<Page> Pages { get; set; }
        public virtual DbSet<Property> Properties { get; set; }
        public virtual DbSet<Review> Reviews { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<TextContent> TextContents { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AboutUsInfo>()
                .Property(e => e.Title)
                .IsUnicode(false);

            modelBuilder.Entity<AboutUsInfo>()
                .Property(e => e.Chat)
                .IsUnicode(false);

            modelBuilder.Entity<AboutUsInfo>()
                .Property(e => e.Quote)
                .IsUnicode(false);

            modelBuilder.Entity<AboutUsInfo>()
                .Property(e => e.ImageUrl)
                .IsUnicode(false);

            modelBuilder.Entity<Blog>()
                .Property(e => e.Name)
                .IsFixedLength();

            modelBuilder.Entity<Blog>()
                .Property(e => e.Title)
                .IsFixedLength();

            modelBuilder.Entity<Blog>()
                .Property(e => e.ImageUrl)
                .IsUnicode(false);

            modelBuilder.Entity<ContactDetail>()
                .Property(e => e.AddressLineOne)
                .IsFixedLength();

            modelBuilder.Entity<ContactDetail>()
                .Property(e => e.AddressLineTwo)
                .IsFixedLength();

            modelBuilder.Entity<ContactDetail>()
                .Property(e => e.PostCode)
                .IsFixedLength();

            modelBuilder.Entity<ContactDetail>()
                .Property(e => e.TelephoneNumberLandLine)
                .IsFixedLength();

            modelBuilder.Entity<ContactDetail>()
                .Property(e => e.TelephoneMobile)
                .IsFixedLength();

            modelBuilder.Entity<ContactDetail>()
                .Property(e => e.RegNumber)
                .IsFixedLength();

            modelBuilder.Entity<ContactDetail>()
                .Property(e => e.EmailAdress)
                .IsFixedLength();

            modelBuilder.Entity<ContactDetail>()
                .Property(e => e.city)
                .IsFixedLength();

            modelBuilder.Entity<ContactDetail>()
                .Property(e => e.facebook)
                .IsUnicode(false);

            modelBuilder.Entity<ContactDetail>()
                .Property(e => e.twitter)
                .IsUnicode(false);

            modelBuilder.Entity<ContactDetail>()
                .Property(e => e.google)
                .IsUnicode(false);

            modelBuilder.Entity<ContactDetail>()
                .Property(e => e.pintrst)
                .IsUnicode(false);

            modelBuilder.Entity<ContactDetail>()
                .Property(e => e.linkin)
                .IsUnicode(false);

            modelBuilder.Entity<ContentImage>()
                .Property(e => e.ImageUrl)
                .IsUnicode(false);

            modelBuilder.Entity<ContentImage>()
                .Property(e => e.OnPage)
                .IsFixedLength();

            modelBuilder.Entity<ContentImage>()
                .Property(e => e.ImageUse)
                .IsFixedLength();

            modelBuilder.Entity<ContentImage>()
                .Property(e => e.ImageName)
                .IsUnicode(false);

            modelBuilder.Entity<ErrorReporting>()
                .Property(e => e.Error)
                .IsUnicode(false);

            modelBuilder.Entity<ErrorReporting>()
                .Property(e => e.File)
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
                .Property(e => e.AvailableFrom)
                .IsUnicode(false);

            modelBuilder.Entity<Property>()
                .Property(e => e.AvaiableTo)
                .IsUnicode(false);

            modelBuilder.Entity<Property>()
                .Property(e => e.RentPrice)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Property>()
                .Property(e => e.Deposit)
                .HasPrecision(19, 4);

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

            modelBuilder.Entity<Review>()
                .Property(e => e.ReviewLeft)
                .IsUnicode(false);

            modelBuilder.Entity<Review>()
                .Property(e => e.UserName)
                .IsFixedLength();

            modelBuilder.Entity<User>()
                .Property(e => e.Username)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.UIDRESET)
                .IsUnicode(false);

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

            modelBuilder.Entity<TextContent>()
                .Property(e => e.Color)
                .IsFixedLength();
        }
    }
}
