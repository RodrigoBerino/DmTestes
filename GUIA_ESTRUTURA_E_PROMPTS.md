# 📁 Guia de Estrutura do Projeto e Prompts Assertivos

## 🗂️ Estrutura Completa do Projeto

```
quiz-app/
│
├── 📄 DOCUMENTAÇÃO/
│   ├── prd_quiz_app.docx                    # PRD completo
│   ├── backlog_quiz_app.xlsx                # Product backlog com 37 tasks
│   ├── roadmap_implementation.md            # Roadmap de 6 semanas
│   ├── fluxograma_user_flow.mermaid        # User journey
│   ├── fluxograma_arquitetura.mermaid      # Clean architecture
│   ├── diagrama_estados.mermaid            # State machine
│   ├── SKILL_DESIGN_UIUX.md                # Design system
│   └── SKILL_QA_TESTING.md                 # QA guidelines
│
├── 📱 lib/
│   ├── main.dart
│   │
│   ├── core/
│   │   ├── theme/
│   │   │   ├── app_colors.dart             # Cores do design system
│   │   │   ├── app_typography.dart         # Tipografia
│   │   │   ├── app_theme.dart              # Theme light/dark
│   │   │   └── app_spacing.dart            # Grid de 8pt
│   │   │
│   │   ├── constants/
│   │   │   ├── api_constants.dart
│   │   │   └── app_constants.dart
│   │   │
│   │   ├── utils/
│   │   │   ├── validators.dart
│   │   │   └── helpers.dart
│   │   │
│   │   ├── errors/
│   │   │   ├── failures.dart
│   │   │   └── exceptions.dart
│   │   │
│   │   └── network/
│   │       ├── network_info.dart
│   │       └── api_client.dart
│   │
│   ├── features/
│   │   │
│   │   ├── quiz/
│   │   │   ├── data/
│   │   │   │   ├── models/
│   │   │   │   │   ├── question_model.dart
│   │   │   │   │   ├── quiz_model.dart
│   │   │   │   │   └── answer_model.dart
│   │   │   │   │
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── quiz_remote_datasource.dart
│   │   │   │   │   └── quiz_local_datasource.dart
│   │   │   │   │
│   │   │   │   └── repositories/
│   │   │   │       └── quiz_repository_impl.dart
│   │   │   │
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   ├── question.dart
│   │   │   │   │   ├── quiz.dart
│   │   │   │   │   └── answer.dart
│   │   │   │   │
│   │   │   │   ├── repositories/
│   │   │   │   │   └── quiz_repository.dart
│   │   │   │   │
│   │   │   │   └── usecases/
│   │   │   │       ├── get_quiz.dart
│   │   │   │       ├── submit_answers.dart
│   │   │   │       └── save_progress.dart
│   │   │   │
│   │   │   └── presentation/
│   │   │       ├── providers/
│   │   │       │   └── quiz_provider.dart
│   │   │       │
│   │   │       ├── widgets/
│   │   │       │   ├── question_card.dart
│   │   │       │   ├── option_radio.dart
│   │   │       │   ├── progress_bar.dart
│   │   │       │   └── navigation_buttons.dart
│   │   │       │
│   │   │       └── screens/
│   │   │           ├── quiz_list_screen.dart
│   │   │           └── quiz_question_screen.dart
│   │   │
│   │   ├── completion/
│   │   │   └── presentation/
│   │   │       ├── widgets/
│   │   │       │   ├── success_animation.dart
│   │   │       │   └── confetti_widget.dart
│   │   │       │
│   │   │       └── screens/
│   │   │           └── completion_screen.dart
│   │   │
│   │   └── evaluation/
│   │       ├── data/
│   │       │   ├── models/
│   │       │   │   └── evaluation_model.dart
│   │       │   │
│   │       │   ├── datasources/
│   │       │   │   └── evaluation_remote_datasource.dart
│   │       │   │
│   │       │   └── repositories/
│   │       │       └── evaluation_repository_impl.dart
│   │       │
│   │       ├── domain/
│   │       │   ├── entities/
│   │       │   │   └── evaluation.dart
│   │       │   │
│   │       │   ├── repositories/
│   │       │   │   └── evaluation_repository.dart
│   │       │   │
│   │       │   └── usecases/
│   │       │       └── submit_evaluation.dart
│   │       │
│   │       └── presentation/
│   │           ├── providers/
│   │           │   └── evaluation_provider.dart
│   │           │
│   │           ├── widgets/
│   │           │   ├── rating_scale.dart
│   │           │   ├── feedback_textfield.dart
│   │           │   └── submit_button.dart
│   │           │
│   │           └── screens/
│   │               └── evaluation_screen.dart
│   │
│   └── app.dart
│
├── 🧪 test/
│   ├── core/
│   ├── features/
│   │   ├── quiz/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   │
│   │   └── evaluation/
│   │       └── ...
│   │
│   └── fixtures/
│       └── quiz_fixture.json
│
├── 🔧 integration_test/
│   ├── app_test.dart
│   └── quiz_flow_test.dart
│
├── 📦 assets/
│   ├── images/
│   ├── icons/
│   └── animations/
│       └── success_check.json
│
├── 🌐 android/
├── 🍎 ios/
│
├── pubspec.yaml
├── analysis_options.yaml
└── README.md
```

---

## 🎯 Como Usar os Arquivos para Criar Prompts Assertivos

### Estratégia: Prompts Contextualizados em Camadas

```
📄 DOCUMENTAÇÃO → 🧠 CONTEXTO → 💬 PROMPT ESPECÍFICO → ✅ OUTPUT
```

---

## 📋 Templates de Prompts por Cenário

### 1️⃣ **CRIAR DESIGN SYSTEM (Theme)**

#### ❌ Prompt Genérico (Ruim)

```
"Crie um theme para o app em Flutter"
```

#### ✅ Prompt Assertivo (Bom)

```
Usando o SKILL_DESIGN_UIUX.md como referência:

Crie o arquivo `lib/core/theme/app_colors.dart` com as cores definidas
na seção "Paleta de Cores":

- Primary Green: #4CAF50 (com variações Light e Dark)
- Secondary Blue: #2E75B6
- Background: #F5F5F5
- Todas as cores de status (Success, Warning, Error, Info, Disabled)
- Todas as cores de texto (Primary, Secondary, Disabled, On Primary)
- Cores para Dark Mode

Estruture como uma classe com constantes estáticas para fácil acesso.
Inclua comentários explicando o uso de cada cor.
```

**Por quê é melhor?**

- ✅ Referencia documento específico
- ✅ Especifica o arquivo exato
- ✅ Lista requisitos claros
- ✅ Define estrutura esperada

---

### 2️⃣ **IMPLEMENTAR FEATURE (Quiz)**

#### ❌ Prompt Genérico (Ruim)

```
"Crie a tela de quiz"
```

#### ✅ Prompt Assertivo (Bom)

```
Com base no PRD (prd_quiz_app.docx), seção "3.1 Módulo de Quiz",
implementar:

**Requisitos Funcionais:**
- RF-001: Exibição de Perguntas (navegação linear)
- RF-002: Escala de Resposta (5 opções fixas)
- RF-003: Indicador de Progresso (X/10)
- RF-004: Validação de Resposta (botão habilitado/desabilitado)

**Arquitetura:**
Seguir Clean Architecture (fluxograma_arquitetura.mermaid):
1. Entity: Question (domain/entities/question.dart)
2. UseCase: GetQuiz (domain/usecases/get_quiz.dart)
3. Repository Interface (domain/repositories/quiz_repository.dart)
4. Screen: QuizQuestionScreen (presentation/screens/quiz_question_screen.dart)

**Design:**
Referência: SKILL_DESIGN_UIUX.md, seção "Tela de Quiz (Pergunta)"
- Header fixo (64dp)
- Progress bar (48dp)
- Pergunta com padding 24dp
- 5 opções com 16dp entre elas
- Footer com botões (72dp)

**Output esperado:**
4 arquivos criados seguindo a estrutura acima.
```

**Por quê é melhor?**

- ✅ Referencia 3 documentos (PRD, arquitetura, design)
- ✅ Lista requisitos específicos com IDs
- ✅ Define arquitetura exata
- ✅ Especifica design visual
- ✅ Quantifica output (4 arquivos)

---

### 3️⃣ **CRIAR TESTES**

#### ❌ Prompt Genérico (Ruim)

```
"Crie testes para o quiz"
```

#### ✅ Prompt Assertivo (Bom)

```
Usando o SKILL_QA_TESTING.md como guia, criar testes para GetQuizUseCase:

**Estrutura:**
Seguir template de "Testes Unitários" da seção correspondente.

**Cenários a cobrir:**
1. ✅ Sucesso: Repository retorna Quiz válido
2. ❌ Erro: Repository retorna ServerFailure
3. ⚠️ Validação: ID vazio não chama repository
4. 🔄 Edge Case: ID muito longo (>100 chars)

**Requisitos:**
- Usar Mockito para mockar QuizRepository
- Arrange-Act-Assert bem definido
- Verificar chamadas aos mocks com verify()
- Nomenclatura: "deve [resultado] quando [condição]"

**Arquivo:**
test/features/quiz/domain/usecases/get_quiz_test.dart

**Meta de coverage:** >90% para esta classe

Gere o código completo seguindo exatamente o template do SKILL.
```

**Por quê é melhor?**

- ✅ Referencia skill específico
- ✅ Lista cenários exatos a testar
- ✅ Define padrões de código
- ✅ Especifica arquivo de destino
- ✅ Define meta quantitativa

---

### 4️⃣ **CRIAR COMPONENTE UI**

#### ❌ Prompt Genérico (Ruim)

```
"Crie um botão verde"
```

#### ✅ Prompt Assertivo (Bom)

````
Referência: SKILL_DESIGN_UIUX.md, seção "Componentes > Botões > Primary Button"

Criar widget reutilizável `PrimaryButton` em:
lib/core/widgets/buttons/primary_button.dart

**Especificações exatas:**
- Altura: 48dp
- Padding: 16dp horizontal
- Border Radius: 8dp
- Background: AppColors.primaryGreen (#4CAF50)
- Text: 14sp, Medium, All Caps, White
- Elevation: 2dp
- Ripple Effect: Habilitado

**Estados:**
- Normal: Background #4CAF50
- Hover: Background #66BB6A
- Pressed: Background #388E3C
- Disabled: Background #E0E0E0, Text #9E9E9E

**Acessibilidade:**
- Minimum touch target: 48x48dp
- Semantic label obrigatório
- Suporte a screen readers

**Exemplo de uso no código:**
```dart
PrimaryButton(
  text: 'PRÓXIMA',
  onPressed: () => print('Pressed'),
  isEnabled: true,
)
````

Use o exemplo de código da seção "Exemplos de Uso" como base.

```

**Por quê é melhor?**
- ✅ Especificações pixel-perfect
- ✅ Todos os estados definidos
- ✅ Inclui acessibilidade
- ✅ Exemplo de uso real
- ✅ Referencia código existente

---

### 5️⃣ **IMPLEMENTAR TASK DO BACKLOG**

#### ❌ Prompt Genérico (Ruim)
```

"Implementa a task de progresso"

```

#### ✅ Prompt Assertivo (Bom)
```

Implementar TASK-008 do backlog (backlog_quiz_app.xlsx):

**Task:** Barra de Progresso
**User Story:** "Como usuário, quero ver meu progresso atual (X/10)
no topo da tela"
**Estimativa:** 6h
**Sprint:** 2
**Dependências:** TASK-006 (Tela de Pergunta)

**Acceptance Criteria:**

1. Barra exibida no topo da tela
2. Formato: "X/10" (ex: "4/10")
3. Preenchimento gradual verde
4. Atualiza dinamicamente ao mudar questão
5. Animação suave de transição (300ms)

**Design Reference:**
SKILL_DESIGN_UIUX.md > "Progress Indicators > Linear Progress Bar"

- Altura: 8dp
- Border Radius: 4dp
- Background: #E0E0E0
- Fill: #4CAF50
- Progress Text: 14sp, Medium, centralizado acima

**Arquitetura:**
Criar widget: lib/features/quiz/presentation/widgets/progress_bar.dart

**Output:**

1. Widget ProgressBar
2. Integração em QuizQuestionScreen
3. Widget test: test/features/quiz/presentation/widgets/progress_bar_test.dart

Incluir animação implícita com AnimatedContainer.

```

**Por quê é melhor?**
- ✅ Referencia task específica com ID
- ✅ Inclui user story e critérios
- ✅ Conecta com dependências
- ✅ Design detalhado
- ✅ Define deliverables completos

---

## 🎨 Prompts Específicos por Tipo de Arquivo

### Para Entities (Domain)

```

Baseado no PRD, seção "5.2 Arquitetura de Camadas > Domain Layer":

Criar entity Question em domain/entities/question.dart

**Campos obrigatórios:**

- id: String
- text: String
- options: List<String> (exatamente 5 opções)
- correctOptionIndex: int (0-4)

**Validações:**

- text não pode ser vazio
- options deve ter exatamente 5 elementos
- correctOptionIndex deve estar entre 0-4

**Métodos:**

- copyWith()
- equals e hashCode
- toString()

Incluir documentação em cada campo explicando seu propósito.
Não incluir lógica de negócio (isso fica nos UseCases).

```

### Para Screens (Presentation)

```

Referências:

- Design: SKILL_DESIGN_UIUX.md, seção "Telas do App > 3. Tela de Avaliação"
- Fluxo: fluxograma_user_flow.mermaid
- Requisitos: PRD, RF-006, RF-007, RF-008

Criar EvaluationScreen em presentation/screens/evaluation_screen.dart

**Layout (top to bottom):**

1. Header com botão voltar e título
2. Pergunta 1: "Como você avalia o treinamento?" + escala 1-10
3. Pergunta 2: "Como você avalia o palestrante?" + escala 1-10
4. Pergunta 3: "O que achou mais impactante?" + TextArea (max 500 chars)
5. Counter de caracteres
6. Botão "Avaliar treinamento" (desabilitado até ter 1 nota)

**State Management:**
Use Provider (EvaluationProvider) para:

- Armazenar nota do treinamento
- Armazenar nota do palestrante
- Armazenar feedback textual
- Validar se pode enviar (mínimo 1 nota)
- Controlar loading ao enviar

**Widgets reutilizáveis:**

- RatingScale (criar em widgets/rating_scale.dart)
- FeedbackTextField (criar em widgets/feedback_textfield.dart)
- PrimaryButton (já existe em core/widgets/)

Seguir estrutura StatefulWidget com initState e dispose.

```

### Para Testes

```

Referência: SKILL_QA_TESTING.md

Criar testes para EvaluationScreen seguindo cenários TC-005 e TC-006:

**TC-005: Avaliar Treinamento**

```dart
testWidgets('deve habilitar botão ao selecionar notas', (tester) async {
  // Arrange: Renderizar tela
  // Act: Selecionar nota 8 e nota 9
  // Assert: Botão habilitado
});
```

**TC-006: Validação - Sem Nota**

```dart
testWidgets('botão desabilitado sem notas selecionadas', (tester) async {
  // Arrange: Renderizar tela
  // Act: Não selecionar nada
  // Assert: Botão desabilitado
});
```

**Adicionar cenários:**

- Contador de caracteres atualiza corretamente
- Feedback é opcional (pode enviar sem)
- Limitação de 500 caracteres funciona
- Callback onSubmit é chamado com dados corretos

Usar find.byKey() para localizar widgets.
Usar tester.pump() após interações.
Coverage mínimo: 85% para este arquivo.

````

---

## 🔄 Workflow de Prompts em Sequência

### Fase 1: Setup (Sprint 1)

```markdown
**Prompt 1: Theme**
Referência: SKILL_DESIGN_UIUX.md
Criar app_colors.dart, app_typography.dart, app_theme.dart, app_spacing.dart
[detalhes...]

**Prompt 2: Constantes**
Referência: PRD, seção 5.1
Criar api_constants.dart com endpoints da seção "Integração API"
[detalhes...]

**Prompt 3: Network Layer**
Referência: backlog_quiz_app.xlsx, TASK-021
Criar api_client.dart com Dio, interceptors, error handling
[detalhes...]
````

### Fase 2: Feature Quiz (Sprint 2)

```markdown
**Prompt 1: Entities**
Referência: PRD, TASK-005
Criar Question, Quiz, Answer entities
[detalhes...]

**Prompt 2: Repository Interface**
Referência: fluxograma_arquitetura.mermaid
Criar quiz_repository.dart (abstract class)
[detalhes...]

**Prompt 3: UseCases**
Referência: TASK-006, TASK-007
Criar GetQuiz, SubmitAnswers usecases
[detalhes...]

**Prompt 4: Screen**
Referência: SKILL_DESIGN_UIUX.md, "Tela de Quiz"
Criar quiz_question_screen.dart com layout especificado
[detalhes...]

**Prompt 5: Testes**
Referência: SKILL_QA_TESTING.md
Criar testes unitários para todos os arquivos acima
[detalhes...]
```

---

## 📊 Checklist de Prompt Assertivo

Antes de enviar um prompt, verifique:

- [ ] **Referencia documento específico** (qual arquivo .md ou .docx?)
- [ ] **Especifica arquivo de destino** (caminho completo)
- [ ] **Lista requisitos claros** (numerados ou em bullet points)
- [ ] **Define estrutura esperada** (classes, métodos, widgets)
- [ ] **Inclui critérios de aceitação** (como validar se está correto?)
- [ ] **Menciona dependências** (quais outros arquivos precisa?)
- [ ] **Quantifica output** (quantos arquivos? qual tamanho?)
- [ ] **Fornece exemplo** (se aplicável, como deve ser usado?)

---

## 🎯 Exemplos de Prompts Completos

### Exemplo Completo 1: Criar Modelo de Dados

````
📋 CONTEXTO:
Referências:
- PRD (prd_quiz_app.docx), seção 5.2
- Backlog (backlog_quiz_app.xlsx), TASK-005
- Arquitetura (fluxograma_arquitetura.mermaid), Data Layer

🎯 OBJETIVO:
Criar QuizModel em lib/features/quiz/data/models/quiz_model.dart

📐 ESPECIFICAÇÕES:

**Campos:**
```dart
class QuizModel {
  final String id;
  final String title;
  final List<QuestionModel> questions;
  final DateTime createdAt;
}
````

**Métodos obrigatórios:**

1. `factory QuizModel.fromJson(Map<String, dynamic> json)`
2. `Map<String, dynamic> toJson()`
3. `Quiz toEntity()` - converte para domain entity
4. `factory QuizModel.fromEntity(Quiz entity)`

**Validações:**

- id não pode ser vazio
- questions deve ter exatamente 10 elementos
- title com mínimo 5 caracteres

**Testes:**
Criar test/features/quiz/data/models/quiz_model_test.dart
Cenários:
✓ fromJson com JSON válido
✓ toJson gera JSON correto
✓ toEntity converte corretamente
✓ Validações lançam exceptions apropriadas

📁 OUTPUT ESPERADO:
2 arquivos:

1. lib/features/quiz/data/models/quiz_model.dart
2. test/features/quiz/data/models/quiz_model_test.dart

Coverage mínimo: 90%

```

### Exemplo Completo 2: Criar Componente Reutilizável

```

📋 CONTEXTO:
Referências:

- SKILL_DESIGN_UIUX.md, seção "Componentes > Radio Buttons"
- Backlog, TASK-007
- Figma: [link do design]

🎯 OBJETIVO:
Criar OptionRadio widget reutilizável

📁 LOCALIZAÇÃO:
lib/features/quiz/presentation/widgets/option_radio.dart

📐 ESPECIFICAÇÕES VISUAIS:

**Dimensões:**

- Altura mínima: 56dp (touch target)
- Padding interno: 16dp horizontal, 12dp vertical
- Border radius: 8dp
- Espaço entre radio e texto: 12dp

**Estados:**

```dart
// Não selecionado
border: 1dp, #E0E0E0
background: transparent
text: #212121

// Selecionado
border: 2dp, #4CAF50
background: #E8F5E9 (verde claro 10% opacidade)
text: #212121
radio: preenchido verde

// Hover (desktop)
background: #F5F5F5

// Disabled
border: #BDBDBD
text: #9E9E9E
```

**API do Componente:**

```dart
OptionRadio(
  label: 'A) Inovação contínua',
  value: 0,
  groupValue: selectedValue,
  onChanged: (value) => setState(() => selectedValue = value),
  isEnabled: true,
)
```

**Acessibilidade:**

- Semantic label: "Opção A, Inovação contínua"
- Minimum touch target: 48x48dp
- Suporte a screen readers
- Focus indicator visível

🧪 TESTES:
Criar test/features/quiz/presentation/widgets/option_radio_test.dart

Cenários:
✓ Renderiza label corretamente
✓ Estado selecionado visual
✓ Callback onChanged é chamado
✓ Disabled não responde a taps
✓ Touch target mínimo de 48dp

📦 DEPENDÊNCIAS:

- AppColors (core/theme/app_colors.dart)
- AppTypography (core/theme/app_typography.dart)

✅ CRITÉRIOS DE ACEITAÇÃO:

1. Visual match 100% com design do Figma
2. Funciona com FormField (validação)
3. Animação de seleção suave (200ms)
4. Passa em todos os testes
5. Sem warnings de acessibilidade

```

---

## 💡 Dicas Avançadas

### 1. Use Contexto Cumulativo

```

// Prompt 1
"Crie app_colors.dart com [especificações...]"

// Prompt 2 (referencia o anterior)
"Agora crie app_theme.dart usando as cores
definidas em app_colors.dart do prompt anterior.
Theme deve ter [especificações...]"

// Prompt 3 (referencia os 2 anteriores)
"Usando app_theme.dart e app_colors.dart criados,
implemente main.dart com MaterialApp configurado..."

```

### 2. Divida Tarefas Complexas

```

❌ Ruim (muito amplo):
"Crie todo o módulo de quiz"

✅ Bom (dividido):
"Passo 1/5: Crie entities (Question, Quiz, Answer)
com [especificações...]"

"Passo 2/5: Crie repository interface usando
entities do passo 1..."

... (continua)

```

### 3. Inclua Exemplos de Dados

```

Criar QuestionModel.fromJson()

JSON de exemplo:

```json
{
  "id": "q1",
  "text": "Qual dos seguintes valores é fundamental?",
  "options": [
    "A) Inovação contínua",
    "B) Maximização do lucro",
    "C) Estagnação",
    "D) Conformidade rígida",
    "E) Desenvolvimento sustentável"
  ],
  "correctOptionIndex": 0
}
```

Parsing deve extrair todos os campos corretamente.

```

### 4. Especifique Formato de Saída

```

OUTPUT em 3 blocos de código separados:

```dart
// 1. question_model.dart
[código aqui]
```

```dart
// 2. question_model_test.dart
[código aqui]
```

```json
// 3. fixtures/question_fixture.json
[JSON aqui]
```

Não combine em uma resposta única.

````

---

## 🚀 Template Master de Prompt

Use este template para qualquer implementação:

```markdown
# 📋 CONTEXTO
**Documentos de referência:**
- [Documento 1]: [Seção específica]
- [Documento 2]: [Seção específica]
- [Documento 3]: [Seção específica]

**Task do Backlog:**
TASK-XXX: [Nome] (Sprint X, Xh estimadas)

**Dependências:**
- TASK-YYY (já implementada)
- TASK-ZZZ (em progresso)

# 🎯 OBJETIVO
[Descrição clara em 1-2 frases do que deve ser criado]

# 📁 ARQUIVOS
**Criar:**
1. [caminho/arquivo1.dart]
2. [caminho/arquivo2.dart]

**Modificar:**
1. [caminho/arquivo_existente.dart] - adicionar X

# 📐 ESPECIFICAÇÕES

## Estrutura de Dados
```dart
[código de exemplo]
````

## Regras de Negócio

1. [Regra 1]
2. [Regra 2]

## Validações

- [Validação 1]
- [Validação 2]

## Design/UI (se aplicável)

- Layout: [descrição]
- Cores: [quais usar]
- Spacing: [medidas]

# 🧪 TESTES

**Cenários obrigatórios:**

1. ✅ [Cenário de sucesso]
2. ❌ [Cenário de erro]
3. ⚠️ [Edge case]

**Coverage mínimo:** X%

# ✅ CRITÉRIOS DE ACEITAÇÃO

- [ ] [Critério 1]
- [ ] [Critério 2]
- [ ] [Critério 3]

# 💬 FORMATO DE OUTPUT

[Como você quer receber a resposta]

# 📊 VALIDAÇÃO

Como vou testar se está correto:

1. [Passo 1]
2. [Passo 2]

```

---

## 📚 Resumo: Do Documento ao Código

```

1. 📄 Leia o PRD → identifique REQUISITO
2. 📊 Consulte BACKLOG → identifique TASK
3. 🎨 Veja DESIGN SKILL → especificações visuais
4. 🏗️ Veja ARQUITETURA → camada correta
5. 💬 Monte PROMPT com todas referências
6. ✅ Valide OUTPUT contra critérios
7. 🧪 Execute TESTES (QA SKILL)
8. 🔄 Itere se necessário

```

---

**Próximos passos sugeridos:**

1. Comece com TASK-001 (Setup)
2. Use template de prompt acima
3. Valide output contra SKILL_DESIGN_UIUX.md
4. Repita para cada task do backlog

Boa implementação! 🚀
```
