# Rails-way
Practicing 'Ruby on Rails' with a given simple assignment.

## FURTHER NOTICE
* To read dev notes, see 'RailsTest_Note.md' in 'dev1' branch; it contains TMI.

## Current State
* Project has been initialized through *Ruby on Rails*
    * confirmed its server is working over *Puma* on 'localhost:3000'
* [InProgress] Route paths and generate controllers
* [Next] Make records/models/entities and migrate DB


## Model
* Generate User and Content models via console (Windows); it seems there's no specific field type for an email neither password, simply use 'string' type for those fields.
> ruby bin/rails generate model User firstName:string lastName:string email:string password:string country:string
> ruby bin/rails generate model Content title:string body:text user:references
* Also, following commands had been used to make controllers.
> ruby bin/rails generate controller Users sign_up sign_in --skip-routes
> ruby bin/rails generate controller Contents create get update delete --skip-routes

## ... 
* Currently working features:
*NOTE - The features has been tested on web browsers, not on POSTMAN; I'll explain the reason why later*
    * sign up
    * sign in; templates only - controller is still struggling
    * content(index); new content can be written, but it'd be failed to be stored in DB, so unable to see it again on 'content'page

* Here's the journey
    * Ruby와 Ruby on Rails가 무엇인지 검색
    * 노트북에 Rails 튜토리얼을 따라 환경 구성
    * controller와 model을 generate 하고, routes.rb에서 POSTMAN specification에 있는 여섯가지 주요 HTTP request에 대한 매핑 진행.
    * 튜토리얼을 참고하며 controller단에서 테스트 도중 경로와 auth 문제 발생.
    * 경로 문제(...api/v1...)의 경우 대부분의 기능은 namespace를 이용하면서 해결됐으나, view와 controller에서의 model 접근을 어렵게 만듦.(한쪽을 해결하면 다른쪽에서 문제가 생김)
    * 인증(auth) 관련 문제는 주로 'Unpermitted parameter error'를 발생시키면서 controller쪽에서 검열됐다. 'params' hash에 대한 조작을 익히면서 당장 ActiveRecord를 생성하는 데는 문제가 없었으나, JWT/O2Auth를 써서 유저를 특정하는 과정이나, basic/bearer token을 이용해서 보안절차를 수행하거나 POSTMAN의 예제를 수행하기 위해서는 더 많은 작업이 필요해보였고, 앞서 언급한 경로 문제 등으로 인한 프레임워크의 비정상적인 형태가 문제 해결을 어렵게 함.
    * 이와 같은 문제가 발생한 가장 큰 이유는 튜토리얼은 API versioning을 고려하지 않고 진행했고, auth에 관해서도 아주 짤막하게 다루고 있기 때문이다. 심지어 CSRF 대응을 위해서지, 인증된 사용자를 위한 것도 아니다. 그런 이유로 초기 진행은 수월했으나 이후 view와 연동하는 부분에서부터 자잘한 버그가 생겼고, 그것을 해결하기 위해 여러 부분을 동시다발적으로 손대다 보니 프로젝트 전체를 손볼 필요성이 있어 시간 소모를 기약할 수 없게 됐다.(현재)
    * POSTMAN collection의 예제들은 아마 대부분 성공하지 못할 것입니다. 경로 문제와 인증 문제 때문에 POSTMAN이 아닌 브라우저에서 view를 이용해가며 테스트한 경우가 많았고, 아예 api만 있는 어플리케이션을 생성할 수 있다는 것도 나중에 알게됐습니다. 아무래도 백엔드 전문 개발자가 아니었기 때문에 발생한 오류라고 생각됩니다. Ruby 및 기타 관련 도구들에 대해서도 지식이 전무했던 점도 컸던것 같습니다. 이후 본 프로젝트는 toy project의 형태로 계속 개선 등을 거쳐, 제시된 API spec뿐만 아니라, fully functional한 형태로 키워나가려고 합니다.

    # About 'contents' part.
    * temporary test data (as I know, it can also be set up using '/db/seeds.rb')
    > INSERT INTO 
    contents(title, body, user_id, created_at, updated_at)
VALUES
    ('First Article', 'First body\nAnd First body''s second line.', 15, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);