![Frota DS Banner](./assets/new_banner.svg)

**App de prova de retenção desenvolvido com animações nativas do Flutter e arquitetura MVVM!**

App Flutter para aplicação de questionários de retenção de conhecimento corporativo, com navegação por **gestos de swipe** estilo Tinder, construído inteiramente com os recursos nativos de animação do Flutter — sem bibliotecas externas de animação.

O App foi desenvolvido usando a **arquitetura MVVM (Model-View-ViewModel)**, separando a View (widgets e interface), ViewModel (lógica de navegação e estado do quiz) e Model (dados das questões).

---

### 1. Rode esse projeto

Siga estes passos para iniciar o projeto localmente:

**a) Clone o repositório**

```bash
git clone git@github.com:RodrigoBerino/dmtestes.git
```

**b) Comandos**

```bash
cd dmtestes

flutter pub get

flutter run
```

---

### 2. Problemática do projeto

O App nasceu da necessidade de tornar provas de retenção corporativa mais engajantes e intuitivas, saindo do modelo tradicional de formulários estáticos.

- A ideia central é navegar entre questões com **swipe horizontal**, assim como apps de cards populares;
- O usuário pode avançar ou voltar entre questões tanto pelo gesto quanto pelos botões;
- Cada troca de card é acompanhada de animações de saída (easeIn), entrada (easeOut) e retorno elástico (elasticOut) quando o swipe não atinge o threshold;
- O progresso é exibido visualmente com uma barra animada que atualiza a cada troca de questão.

---

### 3. Animações nativas do Flutter

Todas as animações foram implementadas com as APIs nativas do Flutter — `AnimationController`, `AnimatedBuilder`, `Tween`, `CurvedAnimation` e `AnimatedContainer` — sem nenhuma dependência externa de animação.

| Animação              | Duração  | Curva      | Onde ocorre                                |
| --------------------- | -------- | ---------- | ------------------------------------------ |
| Saída do card (swipe) | 300ms    | easeIn     | Card sai da tela ao ser arrastado          |
| Retorno ao centro     | variável | elasticOut | Swipe incompleto volta com efeito elástico |
| Entrada do novo card  | 350ms    | easeOut    | Slide + fade-in da próxima questão         |
| Seleção de opção      | 250ms    | easeInOut  | Transição visual do botão selecionado      |
| Barra de progresso    | 400ms    | easeInOut  | Atualização do progresso entre questões    |
| Rotação e opacidade   | —        | —          | Card rotaciona e esmaece durante o arrasto |

---

### 4. Tecnologias

- Flutter
- Dart
- Material Design 3
- Google Fonts (Inter)
- Arquitetura MVVM
- Animações nativas (AnimationController, Tween, CurvedAnimation)
- Gerenciamento de estado com ChangeNotifier (sem pacotes externos)

---
