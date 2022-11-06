import { Table, IsEmail, Column, Model, PrimaryKey, Unique, IsAlphanumeric, Validate, Length, DataType, NotNull, AllowNull } from 'sequelize-typescript';

@Table
export class User extends Model {
  @PrimaryKey
  @IsAlphanumeric
  @Column(DataType.STRING)
  name!: string;

  @Unique
  @AllowNull(false)
  @IsEmail
  @Column(DataType.STRING)
  email!: string;
}