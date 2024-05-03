import { Router } from "express";
import { actualizarAdmi, admiEliminar, categorias, createAdmi } from "../controller/categoria.controller.js";

const router = Router()

router.get('/admi/categoria', categorias)

router.get('admi/create', createAdmi)

router.put('admi/update/:id', actualizarAdmi)

router.delete('/admi/delete/:id', admiEliminar)

export default router