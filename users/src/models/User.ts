import { Table, IsEmail, Column, Model, PrimaryKey, Unique, IsAlphanumeric, Validate, Length, DataType, NotNull, AllowNull, HasMany, BelongsTo } from 'sequelize-typescript';

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

  @HasMany(() => Bob)
  bobs!: Bob[]
}

@Table
export class Bob extends Model {
  @PrimaryKey @IsAlphanumeric 
  @Column(DataType.STRING)
  name!: string;

  @Unique @AllowNull(false) @IsEmail
  @Column(DataType.STRING)
  email!: string;

  @BelongsTo(() => User)
  user!: User;
}