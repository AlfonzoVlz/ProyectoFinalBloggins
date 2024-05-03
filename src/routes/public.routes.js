import { Router } from "express";
import { eliminarPublic, filtrarCategoria, filtrarTitulo, mostrarPublic, publicacion, updatePublic } from "../controller/publicontroler.js";


const router = Router()

router.get('/public', publicacion)

router.put('/public/:id', updatePublic)

router.delete('/public/:id', eliminarPublic)

router.get('/publicmostar', mostrarPublic)

router.get('/public/titulo/:titulo', filtrarTitulo)

router.get('/public/categoria/:categoria_publicaciones_id', filtrarCategoria)

export default router







