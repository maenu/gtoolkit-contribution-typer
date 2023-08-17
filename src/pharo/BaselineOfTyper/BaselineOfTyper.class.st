Class {
	#name : #BaselineOfTyper,
	#superclass : #BaselineOf,
	#category : #BaselineOfTyper
}

{ #category : #baselines }
BaselineOfTyper >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'Typer-Core';
				package: 'Typer-Checker';
				package: 'Typer-Inference';
				package: 'Typer-Pragma';
				package: 'Typer-Dynamic';
				package: 'Typer-Shadow';
				package: 'Typer-Shadow-Pharo';
				package: 'Typer-Shadow-Bloc';
				package: 'Typer-Shadow-Brick';
				package: 'Typer-Shadow-GToolkit';
				package: 'Typer-Shadow-SmaCC';
				package: 'Typer-GToolkit' ]
]
