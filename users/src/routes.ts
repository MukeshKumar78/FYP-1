import { Router, Request, Response } from "express";
import passport from 'passport';
import jwt from 'jsonwebtoken';

const JWTSecret: string = process.env.JWT_SECRET;
const router = Router();

router.get('/auth', passport.authenticate('jwt', { session: false, failureRedirect: '/auth/google', passReqToCallback: true}), (req: Request, res: Response) => {
  return res.json(req.user);
})

router.get('/auth/google', passport.authenticate('google', {
  passReqToCallback: true,
  scope: ['profile', 'email']
}))

router.get('/auth/google/callback', passport.authenticate('google', { session: false ,failWithError: true }), (req: Request, res: Response) => {
  if(!req.user) return res.sendStatus(401);

  const token = jwt.sign(req.user, JWTSecret, { expiresIn: '7d' });
  res.cookie('jwt', token);
  if(req.headers.referer)
    return res.status(200).redirect(req.headers['referer']);
  return res.redirect('/');
})

export default router;