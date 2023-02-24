# Note for **Rails Test**
*Note - Check out 'README.md' to read technical documentation.* <br>
*... And also notice that, I'll use both Korean and English in here for convenience.(I told you this is just a scratch note - sorry, it's in the next line)* <br>
This document is a scratch and also a study note; writing all my thoughts, the things that I've learnt, and my plans and approaches to handle the problem.
After the project is done, a new document named 'StudyNote.md' will be published by gathering 
... by the aspects and the topics.

I'm planning to write down this document day by day, making it possible to figure out the progress.

## 1. Day 1 (21. Feb. 2023)
### Prologue
11시를 생각했는데 10시에 메일이 와있었고, 11시가 좀 넘은 시점에서 과제 내용을 조금 보고 이것저것 오전 일과를 하면서 든 생각들은 이러하다.
* *일단 이름에 rails가 들어가있는데 혹시 뭐 Ruby 얘긴가... 진짠가본데... 이 회사 기술 스택 우선순위 때문인가? 최근에는 Python만 써서 이쪽 프레임워크로라도 해결해야하나... 다른 언어 쓰면 불리하다곤 하는데...*
* *아 새로운 기술 습득 능력 같은걸 보기 위해서라고 적혀있구나. 애초에 쓸 줄 모른다는걸 알고 내주신거군.*(뒷문장부터 건너뛰어 읽어서 생긴 문제)
    * *어떻게든 해내기만 하면 기술 스택 느는거네? 댕꿀*
* *이 과제는 확실히 알고리즘에 중점을 둔 문제는 아니고, 다른 측면들을 살펴보고자 하는거 같네.*
* *일단 내 현재 상황이랑 72시간에 대해 생각해봤는데... 1일차에 기술 스택에 대한 지식이나 문제 해결 방법의 고민 등을 포함한 추상적인 업무와 함께 환경 세팅을 수행하고, 2일차에 1일차의 분석 내용들을 바탕으로 실질적인 개발 과정에 돌입(목표는 도달 가능한 선에서 최소 80% 정도), 3일차는 남아있는 문제들에 대한 해결과 (가능하면) 테스팅을 구현하고 수행해보기. 4일차 아침까지는 임의로 이번 과제를 통해 배운 것들을 정리하는 스터디 노트를 별도로 작성할 생각.(이건 제출 대상에 포함되지 않고, 제출 기한 이후에 작성 완료하여 repo에 올릴지도 모름)*
##### 나에 대한 분석
* Ruby on Rails랑 Ruby랑 같은건지도 모르고 이름만 들어봐서 전혀 아는게 없음.
* Docker 얘기가 있네. 오케스트레이션 툴들은 기본 개념만 알지 아직 안써봄.
* ...
#### 문제를 확인하면서 깨달은 것
* *걱정하지 마세요 나는 pseuodo입니다*
* POSTMAN이 등장했다. 웹알못인 나도 설치해둔 몇 안되는 도구 중 하나인데 덕분에 간단하게 local에 **collection**을 duplicate 해올 수 있었다.
* ...

#### 'Question' list
* Ruby on Rails랑 Ruby랑 R이랑 관계가... 그... 있나?
    > Ruby와 R이 언어고, 역시 R은 아주 다른 언어(통계/데이터 쪽에서 많이 쓰는 그거)에다가,
    Ruby가 Python과 종종 짝으로 보이던 이유가 유사한 interpreter식 언어라서 그런거였다. 일본쪽에서 개발,
    그 동네에서 좀 더 비중있게 쓰인다는 것 같다. Ruby on Rails는 Rails라고도 불리며,
    그냥 Ruby에서 동장하는 Web (Application) Framework를 말하는 거였다.
    생각보다 관계는 간단하네. 이제 Rails가 그냥 Web Fw라는 걸 알았으니 양식에 맞춰 요구사항에 맞는 app을 만들면 되겠다.
* Ruby on Rails는 IDE 뭐 씀?
* Ruby on Rails는 어디서 어떻게 돌아감?
* 'commit을 최대한 적게 하라': local에서 일부 commit만 선별해서 push할 수 있나?(가능 ㅇㅇ)
    * 아니면 아예 개발 branch를 분리하고 main에 merge시키는 것도 괜찮을 것 같은데. <br>
    과정을 공개할 것 같으면(public repo) 진행도를 보여줄 수 있는 그 쪽이 더 공개하기 좋을 것 같다.
    (물론 public repo로 둔다면 문제와 관련된 직접적인 내용은 제외해야겠지)
* 
#### 'TODO' list (구체적)
* Ruby on Rails crash courses or tutorials
    * 실행 환경, 프로젝트 구성, 기본 문법, 빌드 방법(be executable), 런타임 구성 및 실행 방법 등(테스팅 관련한 내용은 좀 더 나중에)
* RoR을 위한 IDE 세팅
* 도커 준비
* 도커 사용

### [Task] Day1
* 하루에 어느 정도의 시간을 투자할 것인지?
    > 통상적인 경우를 고려했을 때 2-4시간 정도를 소모하는게 맞을 것이다. 다른 일을 하거나 하는 사람들은 그 정도 주어진 여유 시간으로 이 과제를 해결해서 제출할테니까.
* Ruby on Rails에 대해 알아보기
    > 위의 'Question' 파트에서 Ruby와 Rails에 대해 대충 알아봤다.
    * 우선 Ruby의 문법에 대해 알아본다.(아래는 참고 자료 링크)
        * 'List of Free Programming Books': (우선) 무료 자료 목록이 있는 링크(Rails 쪽에서 레퍼런스 링크 찾음)
        > https://github.com/EbookFoundation/free-programming-books/blob/master/books/free-programming-books-langs.md#ruby
        * 'Ruby in Twenty Minutes': 20분만에 Ruby 볼 수 있다는데?
        > https://www.ruby-lang.org/en/documentation/quickstart/
* ...
* 비즈니스 로직 디자인(기술 스택을 배우는 과정 중이니까 일단 요구사항부터 분석하고 정리할 생각)
* Docker 구성과 실행 환경 구축

## 2. Day 2 (22. Feb. 2023)
### 현황 (1420HRS)
어제 일정이 꼬이는 바람에 충분히 원하는 목표를 달성하지 못했고, 오늘은 일단 *AWS*의 AI/ML 세미나가 있는 데다가 지난밤 늦잠까지 자서 가용한 에너지나 시간이 부족해질 것 같다. 어제 달성하지 못한 많은 부분부터 커버하고, 조금 더 구성에 신경을 써보도록 하자. 당장은 디테일한 요소(validation 수준)보다 환경(넓게는 생태계)에 대한 이해와 구축 과정이 중요하다.(그래도 당연히 verification 수준에는 다다라야 할 것)
### [Task] Day2
* 오늘의 작업은 다음 두 가지 작업부터 개시해야 할 것 같다.
    1. 우선 *Ruby*가 실행 가능한 환경을 구축해야하고,
        * *Ruby* installer로 *Ruby*를 설치해야하고,
        * *Ruby* 인터프리터 상에서 *Rails* 설치를 할 수 있는 것 같다.
        * *SQLite3* 설치에 관한 언급을 가이드를 훑어보다 봤는데, *Ruby* 전용으로 설치를 해야하는건지 아니면 *Ruby*에서 접근 가능하도록 라이브러리를 설치해야하는 건지는 잘 모르겠다.(그리고 DB는 일단 *SQLite3* 정도로 충분할 것 같다)
    2. 주어진 문제에 대해 보다 명확한 이해(배경지식에 대한 이해, 요구되는 기술적 바운더리 찾기 등을 포함해서)
        * 2.1 Requirements & Constraints - *API/Entities*
            > **Endpoint**:
                > * API URL들은 다음 포멧의 상대 경로: 'http://\<host\>:\<port\>/api/v1'
                >    * https와 관련된 요소는 넘어감
                > * **Model**에는 버전을 메기지 않도록 할 것.

            > **User**:
                > * 로그인(sign-in)을 지원.
                >    * 회원가입(sign-up)과 로그아웃(sign-out)은 고려하지 않음
            
            > **Content**:
                > * 모든 사용자가 게시물 작성 가능. 수량 제한 없음.
                >   * 게시물은 반드시 한 명의 사용자와 매핑됨
                > * 게시물의 수정과 삭제는 작성자만 가능.
                >   * 작성자를 제외한 모든 (인증된) 사용자는 게시물을 읽을 수만 있음.

            > **Request**:
                > * request params는 camelCase로 작성할 것 (POSTMAN 관련)
            
            > **Response**:
                > * 모든 response는 JSON 직렬화돼야함

        * ~~2.2 Requirements & Constraints - *Unit Test*~~
            > <U>*이후에 다루겠음.*</U>
        
        * 2.3 Requirements & Constraints - ...

        * 2.x Plans & Considerations - 도커화(Dockerfile, Docker Compose configuration files)
            > 도커를 사용하는걸 전제로 하고 있는것 같다

## 3. Day 3 (23. Feb. 2023)
### 현황 (1052HRS)
*'누구나 그럴싸한 계획이 있다. 일이 꼬이기 전까진.'* - 어제 *Github Projects*에 프로젝트를 생성해두고, 어렵사리 노트북에 환경을 구축한 다음(*Docker* 제외) *Rails* 프로젝트를 생성해서 서버가 동작하도록 하는 것까지는 확인했다.
원래 같으면 어제 비즈니스 로직을 대략 완성하고 API 구현/구성까지는 한 상태여야했다.(DB 연결은 가능하다면 해두는거고)
아무튼 오늘 할 일이 많아졌다. 백신 프로그램에 *SQLite3*가 먹통이 되는 그런 종류의 이상한 일들이 오늘은 없기를 바라면서, *Ruby* 문법을 조금 더 본 다음 *Rails*의 튜토리얼을 따라 작업을 계속 진행하기로 한다.
(*Ruby*의 문법과 구조에 대해 조금 더 알아보려는건 아직 IDE 선정 단계에도 다다르지 못했기 때문이다 - 그냥 간단하게 *VSCode*를 써도 괜찮은지, 다른걸 쓸지의 문제도 있고)
~~일단 한숨 자고 싶은데...~~

### TODO? 
* *Rails*에서 HTTP request를 매핑하는 방법?
* 현재 작업중인 주요 도구(소프트웨어)들에 대한 버전 정리
* ORM, DTO, DAO와 관련된 부분; [사용자]와 [게시물]에 대한 정보가 DB에서 다뤄져야함
* *Ruby* 문법과 관련된 추가적인 내용 수시로 찾아보기

### ...
{2023-02-23 17:25:07}
~~사..살려줘..~~ 하필이면 이 시기의 육체적인 컨디션 난조 탓에 작업 속도가 더뎌졌다...

## 4. Day 4 (24. Feb. 2023)
~~기절했다~~ 두 시간 남았다. 모델 형성 후, DB 마이그레이션으로 스키마를 생성하고, 할 수 있는 데까지 API랑 매핑하고 제출해야할 것 같다. 도커 적용 및 적절한 HTTP response를 모두 고려하기엔 시간이 부족하다.
{2023-02-24 08:02:31}

* 
