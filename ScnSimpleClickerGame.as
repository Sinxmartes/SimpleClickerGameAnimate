import flash.display.Loader;
import flash.utils.Timer;
import flash.events.TimerEvent;

//variaveis
var quantidade:int = 0;
var clicksMult:int = 15;
var i:int = 1;
var timer:Timer = new Timer(1000);
var load:Boolean = false;
var count:int = 0;
var timerPower:Timer = new Timer(1000, 5);
var ticks:int = 0;

//carregamento onLoad
onLoad();

function clique (event:MouseEvent):void
{
	quantidade = quantidade + i;
	LblLatinha.text = (quantidade.toString());
}

function up (event:MouseEvent):void
{
	if (quantidade >= clicksMult)
	{
		quantidade = quantidade - clicksMult;
		i++;
		clicksMult = clicksMult * 2;
		atualizar();
	}
	else
	{
		LblMsg.visible = true;
	}
}

function onLoad():void
{
	atualizar();
	timer.start();
}

function atualizar():void
{
	LblPowerUP.text = (i.toString());
	LblCustoPowerUP.text = (clicksMult.toString());
	LblLatinha.text = (quantidade.toString());
}

function onTick(event:TimerEvent):void
{
	ticks++;
	if (i<=5)
		quantidade++;
	else if (i<=10)
		quantidade+=5;
	else if (i<=25)
		quantidade+=10;
	atualizar();
	if (LblMsg.visible)
	{
		count++;
		if (count==2)
		{
			LblMsg.visible = false;
			count=0;
		}
	}
	/*trace(ticks%30);
	trace(int(Math.random()*30));
	if(ticks%30==(int(Math.random()*30)))
	{
		BtnRnd.visible = true;
	}*/
}

function onTickPower(event:TimerEvent):void
{
	quantidade+=i*3;
	atualizar();
}

function onClickPower(event:MouseEvent):void
{
	timerPower.start();
}

BtnLatinha.addEventListener(MouseEvent.CLICK, clique);
BtnPowerUP.addEventListener(MouseEvent.CLICK, up);
BtnRnd.addEventListener(MouseEvent.CLICK, onClickPower);
timer.addEventListener(TimerEvent.TIMER, onTick);
timerPower.addEventListener(TimerEvent.TIMER, onTick);
addEventListener('load', onLoad);
