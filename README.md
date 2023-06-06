# Projeto Labook
O Labook é uma rede social com o objetivo de promover a conexão e interação entre pessoas. Quem se cadastrar no aplicativo poderá criar e curtir publicações.


# Conteúdos abordados
 NodeJS
(x) Typescript
(x) Express
(x) SQL e SQLitex(x) Knex
(x) POO
(x) Arquitetura em camadas
(x) Geração de UUID
(x) Geração de hashes
(x) Autenticação e autorização
(x) Roteamento
(x) Postman

# Banco de dados
![projeto-labook (2)](https://user-images.githubusercontent.com/29845719/216036534-2b3dfb48-7782-411a-bffd-36245b78594e.png)

## Endpoints
    - [x]  signup
    - [x]  login
    - [x] get posts
    - [x]  create post
    - [x]  edit post
    - [x]  delete post
    - [x]  like / dislike post

## Autenticação e autorização
    - [x]  identificação UUID
    - [x] senhas hasheadas com Bcrypt
    - [x]  tokens JWT
 
 - Código
    - [x]  POO
    - [x]  Arquitetura em camadas
    - [x]  Roteadores no Express


## Like or dislike post (mesmo endpoint faz as duas coisas)

Endpoint protegido, requer um token jwt para acessá-lo.<br>
Quem criou o post não pode dar like ou dislike no mesmo.<br><br>
Caso dê um like em um post que já tenha dado like, o like é desfeito.<br>
Caso dê um dislike em um post que já tenha dado dislike, o dislike é desfeito.<br><br>
Caso dê um like em um post que tenha dado dislike, o like sobrescreve o dislike.<br>
Caso dê um dislike em um post que tenha dado like, o dislike sobrescreve o like.

### Para entender a tabela likes_dislikes
- no SQLite, lógicas booleanas devem ser controladas via 0 e 1 (INTEGER)
- quando like valer 1 na tabela é porque a pessoa deu like no post
    - na requisição like é true
    
- quando like valer 0 na tabela é porque a pessoa deu dislike no post
    - na requisição like é false
    
- caso não exista um registro na tabela de relação, é porque a pessoa não deu like nem dislike
- caso dê like em um post que já tenha dado like, o like é removido (deleta o item da tabela)
- caso dê dislike em um post que já tenha dado dislike, o dislike é removido (deleta o item da tabela)

## Documentacao do Postman
(https://documenter.getpostman.com/view/24823438/2s93sXdFJY)