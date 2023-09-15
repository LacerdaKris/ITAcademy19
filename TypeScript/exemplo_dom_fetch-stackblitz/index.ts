// Import stylesheets
import './style.css';
import { FotoDto } from './fotoDto';

// Write TypeScript code!
async function cliqueDoBotao() {
  const urlBase = 'https://jsonplaceholder.typicode.com';
  const campoId = document.getElementById('campoId') as HTMLInputElement;
  const divDados = document.getElementById('divDados');
  const imgFoto = document.getElementById('imgFoto') as HTMLImageElement;
  try {
    const id = campoId.value;
    const resposta = await fetch(`${urlBase}/photos/${id}`);
    if (resposta.ok) {
      const dados = (await resposta.json()) as FotoDto;
      divDados.innerHTML = `<h2>${dados.title}</h2>`;
      imgFoto.src = dados.thumbnailUrl;
    } else {
      divDados.innerHTML = `<p>Falha na busca: ${resposta.status}</p>`;
    }
  } catch (error) {
    divDados.innerHTML = `<p>Falha na busca: ${(error as Error).message}</p>`;
  }
}

const botaoBuscar = document.getElementById('botaoBuscar');
botaoBuscar.onclick = cliqueDoBotao;
