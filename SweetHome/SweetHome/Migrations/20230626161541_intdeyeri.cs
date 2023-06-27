using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SweetHome.Migrations
{
    public partial class intdeyeri : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Products_Teams_TeamId",
                table: "Products");

            migrationBuilder.AlterColumn<int>(
                name: "TeamId",
                table: "Products",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_Products_Teams_TeamId",
                table: "Products",
                column: "TeamId",
                principalTable: "Teams",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Products_Teams_TeamId",
                table: "Products");

            migrationBuilder.AlterColumn<int>(
                name: "TeamId",
                table: "Products",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Products_Teams_TeamId",
                table: "Products",
                column: "TeamId",
                principalTable: "Teams",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
