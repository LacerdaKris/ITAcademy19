import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/novo_chamado',
      name: 'novo_chamado',
      component: () => import('../views/NovoChamadoView.vue')
    },
    {
      path: '/atender_chamado_manutencao',
      name: 'atender_chamado_manutencao',
      component: () => import('../views/AtenterManutView.vue')
    },
    {
      path: '/atender_chamado_substituicao',
      name: 'atender_chamado_substituicao',
      component: () => import('../views/AtenderSubstView.vue')
    },
    {
      path: '/listar_chamados',
      name: 'listar_chamados',
      component: () => import('../views/ChamadosView.vue')
    }
  ]
})

export default router
