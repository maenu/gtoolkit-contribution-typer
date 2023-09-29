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
				package: 'Typer-Pragma';
				package: 'Typer-Shadow';
				package: 'Typer-Inference';
				package: 'Typer-Dynamic';
				package: 'Typer-Checker';
				package: 'Typer-GToolkit';
				package: 'Typer-Shadow-Pharo';
				package: 'Typer-Shadow-Bloc';
				package: 'Typer-Shadow-Brick';
				package: 'Typer-Shadow-GToolkit';
				package: 'Typer-Shadow-SmaCC' ]
]
