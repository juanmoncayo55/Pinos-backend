import {Router} from "express";
import PinoController from "../controller/PinoController.js";
const pc = new PinoController();

const router = Router();

router.post("/crear", pc.registrarEncuesta);

export default router;