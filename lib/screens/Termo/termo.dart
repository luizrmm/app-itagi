import 'package:aqui_cliente/screens/Termo/title.dart';
import 'package:flutter/material.dart';

class Termo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Termo e política de privacidade'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Aplicativo “Prefeitura de Barreiras”',
                textAlign: TextAlign.center,
                style: Estilo().estilo,
              ),
              Text(
                'O Aplicativo “Prefeitura de Barreiras” foi idealizado pela Prefeitura e desenvolvido pela empresa parceira Easy Wat Tecnologia, para dispositivos móveis com sistemas Android e iOS.\n\n A Easy Wat Tecnologia tem como preceito assegurar a privacidade e segurança dos aplicativos desenvolvidos para nossos usuários, assim sendo, foi elaborado este documento expondo e transparecendo a política de privacidade e uso da ferramenta.\n\n O aplicativo “Prefeitura de Barreiras” concentra diversas informações referentes aos serviços prestados no Município de Barreiras para a população, podendo também o cidadão participar, indicando locais que necessitam da atenção da prefeitura, como exemplo troca de lâmpadas, poda de arvores, manutenção de vias públicas, além de consulta a eventos e notícias da cidade.\n\n Através da câmera do celular e do GPS, é disponibilizado o recurso de “Relatar Problemas”, no qual o usuário pode fotografar a ocorrência, colocar dados e observações sobre o local e enviar para a prefeitura.\n\n Ao realizar o cadastro para utilização do Aplicativo, o usuário se submeterá automaticamente às regras e condições deste Termo de Uso e Política de Privacidade. Alertamos que caso não concorde com os termos desta política, não prossiga.',
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'I – POLÍTICA DE PRIVACIDADE',
                  style: Estilo().estilo,
                ),
              ),
              Text('1- Coleta de Dados',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  '1.1 Informações fornecidas pelo usuário',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'O cadastro para utilização do Aplicativo é realizado no primeiro acesso. São solicitadas as seguintes informações do usuário para cadastro e acesso ao Aplicativo: Nome, E-mail, Telefone, Endereço Completo. \n\n As informações requisitadas para cadastro para acesso ao Aplicativo permanecerão armazenadas localmente no próprio dispositivo móvel do usuário e em banco de dados externo para sincronização dos sistemas de gerenciamento de munícipes da Prefeitura de Barreiras.\n\n Durante a navegação no Aplicativo o usuário poderá efetuar solicitações de serviços e comunicações de ocorrências, denominadas Pesquisa de Satisfação, Enquetes e Relatar Problemas. Entretanto, para isso o usuário deverá obrigatoriamente informar os seus dados cadastrais. Caso o usuário opte por não informar seus dados de cadastro, este não poderá utilizar o aplicativo. Opcionalmente, o usuário poderá inserir uma foto e a localização quando relatar um problema.\n\nO Aplicativo, ao iniciar pela primeira vez, ou se as permissões não estiverem ativas, irá solicitar ao usuário acesso à câmera, galeria de fotos e serviços de localização do dispositivo móvel. O acesso do Aplicativo a estas funções do dispositivo móvel somente será efetuada após à autorização do usuário e para os fins específicos para os quais é necessário o acesso.\n\n Caso o usuário Relate um Problema, as informações da solicitação e os dados do usuário serão enviados para o setor responsável pela demanda na prefeitura.',
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
                child: Text(
                    '1.2 Informações coletadas durante a navegação no Aplicativo',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Text(
                'Durante a navegação no Aplicativo serão coletadas apenas as informações sobre a navegação nos serviços disponíveis no próprio Aplicativo.',
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text('2- Tratamento dos dados coletados',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              ),
              Text(
                'As informações coletadas durante o cadastro serão armazenadas localmente no dispositivo móvel do usuário e no banco externo. Ao excluir o Aplicativo do dispositivo móvel as informações do usuário serão automaticamente excluídas do telefone, mas poderá efetuar novamente o login sem novo cadastro, pois o mesmo já está registrado na base externa.\n\n Caso o usuário interaja com serviços do aplicativo, as informações enviadas serão utilizadas somente para os fins previstos neste Termos de Uso e Política de Privacidade, em nenhuma circunstância, tais informações serão vendidas, alugadas, cedidas ou compartilhadas com terceiros, exceto por ordem judicial.\n\n Para fins estatísticos e de pesquisa, o usuário autoriza a Prefeitura ou terceiros por ela indicados, a utilizar, por prazo indeterminado, as informações fornecidas.\n\n A Prefeitura se compromete a não utilizar e-mails fornecidos para políticas de Spam ou envio de e-mails indesejados.',
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'II – TERMOS DE USO',
                  style: Estilo().estilo,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                    '1- Solicitações de demandas enviadas pelos usuários',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              ),
              Text(
                'É terminantemente proibido transmitir, através deste Aplicativo, qualquer material de cunho obsceno, difamatório, vexatório ou ilegal, bem como textos ou criações de terceiros sem a autorização do autor. Neste caso o usuário responderá de acordo com a legislação vigente.\n\n A PMJ poderá, sem prévio aviso, bloquear e cancelar o acesso ao Aplicativo quando verificar que o usuário praticou algum ato ou mantenha conduta que (i) viole as leis e regulamentos federais, estaduais e/ou municipais, (ii) contrarie as regras destes Termos de Uso, ou (iii) viole os princípios da moral e dos bons costumes.\n\n Toda e qualquer ação executada ou conteúdo enviado pelo usuário durante o uso do Aplicativo será de sua exclusiva e integral responsabilidade, devendo isentar a PMJ de quaisquer reclamações, prejuízos, perdas e danos causados, em decorrência de tais ações ou manifestações.',
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text('2 – Disponibilidade do Aplicativo',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              ),
              Text(
                'A PMJ se reserva o direito de incluir, excluir ou alterar os conteúdos e funcionalidades do Aplicativo, bem como suspendê-lo temporariamente ou cancelá-lo, a qualquer momento, independentemente de aviso prévio ao usuário.',
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text('3 – Direitos autorais e propriedade intelectual',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              ),
              Text(
                'Os documentos, conteúdos e criações contidos neste Aplicativo pertencem à Prefeitura de Jacareí e são protegidos por leis nacionais e internacionais. Não podem ser modificados, alterados ou atualizados de qualquer maneira sem autorização prévia e por escrito dos responsáveis. \n\n A reprodução ou armazenamento de materiais recuperados a partir deste serviço sujeitará os infratores às penas da lei. Alguns direitos de uso podem ser cedidos pela PMJ em contrato ou licença especial, que pode ser cancelada a qualquer momento se não cumpridos os seus termos.',
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'III – CONSIDERAÇÕES FINAIS',
                  style: Estilo().estilo,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                    '1 – Mudanças na Política de Privacidade e Termos de Uso',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              ),
              Text(
                'Essa Política de Privacidade e Termos de Uso pode passar por atualizações cuja versão mais recente estará sempre disponível para consulta no próprio Aplicativo.\n\nQualquer dúvida em relação a nossa Política de Privacidade e termos de uso poderá ser esclarecida entrando em contato conosco, mediante envio de e- mail para: contato@barreiras.ba.gov.br.',
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                    '2- Eventuais violações à Política de Privacidade e Termos de Uso',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              ),
              Text(
                'Fica eleito o Foro da Comarca da cidade de Barreiras, Estado da Bahía, para dirimir quaisquer questões decorrentes destes Termos de Uso e Política de Privacidade, que será regido pelas leis brasileiras.',
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}
