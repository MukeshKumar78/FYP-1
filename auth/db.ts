import { Sequelize } from 'sequelize-typescript';
import { User } from './models/User';

const uri = process.env.DB_URI || '';
export const connection = new Sequelize(uri, {
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