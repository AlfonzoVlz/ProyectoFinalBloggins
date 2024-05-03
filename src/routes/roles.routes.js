import { Router } from "express";
import { filter } from "../controller/roles.controller.js";

const router = Router()

router.get('/admi', filter)

export default router