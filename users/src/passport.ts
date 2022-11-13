import GoogleStrategy from 'passport-google-oauth20';
import JWTStrategy from 'passport-jwt';
import { Request } from 'express';

const clientID: string = process.env.PROVIDER_CLIENT_ID;
const clientSecret: string = process.env.PROVIDER_CLIENT_SECRET;
const JWTSecret: string = process.env.JWT_SECRET;

export const googleStrategy = 
  new GoogleStrategy.Strategy({
    clientID,
    clientSecret,
    callbackURL: '/auth/google/callback'
  },
  (_accessToken, _refreshToken, profile, done) => {
    done(undefined, profile);
  })

export const jwtStrategy =
  new JWTStrategy.Strategy(
    {
      jwtFromRequest: (req: Request) => {
        let token = null;
        if (req && req.cookies) {
          token = req.cookies.jwt;
        }
        return token;
      },
      secretOrKey: JWTSecret, 
    },
    (jwtPayload, done) => {
      if (!jwtPayload) {
        return done(null);
      }
      return done(null, jwtPayload);
    }
  )