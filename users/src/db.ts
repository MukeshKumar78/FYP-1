import { Sequelize } from 'sequelize-typescript';
import { User } from './models/User';

export const connection = new Sequelize(process.env.DB_URI, {
  models: [__dirname + '/models'],
});

export const initializeDatabase = async () => {
  try {
    await User.sync({force: true})

    console.log('Connection established and models synced successfully.')
  } catch (error) {
    console.error('Unable to connect to the database:', error)
  }
}