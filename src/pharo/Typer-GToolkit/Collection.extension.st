Extension { #name : #Collection }

{ #category : #'*Typer-GToolkit' }
Collection >> typGtAsCoverageElement [
	| executed notExecuted notInstrumented executedButton notExecutedButton notInstrumentedButton instrumentedLabel allLabel |
	executed := self at: true ifAbsent: [ #() ].
	notExecuted := self at: false ifAbsent: [ #() ].
	notInstrumented := self at: nil ifAbsent: [ #() ].
	executedButton := BrButton new
		look: BrGlamorousButtonWithLabelLook;
		label: executed size asString , ' executed';
		action: [ :e | e phlow spawnObject: executed ];
		yourself.
	notExecutedButton := BrButton new
		look: BrGlamorousButtonWithLabelLook;
		label: notExecuted size asString , ' not executed';
		action: [ :e | e phlow spawnObject: notExecuted ];
		yourself.
	notInstrumentedButton := BrButton new
		look: BrGlamorousButtonWithLabelLook;
		label: notInstrumented size asString , ' not instrumented';
		action: [ :e | e phlow spawnObject: notInstrumented ];
		yourself.
	instrumentedLabel := BrLabel new
		look: BrGlamorousLabelLook;
		text:
			([ 100 * executed size / (executed size + notExecuted size) ]
				on: ZeroDivide
				do: [ 0 ]) asFloat asString , '% coverage of instrumented';
		yourself.
	allLabel := BrLabel new
		look: BrGlamorousLabelLook;
		text:
			([ 100 * executed size
				/ (executed size + notExecuted size + notInstrumented size) ]
				on: ZeroDivide
				do: [ 0 ]) asFloat asString , '% coverage of all';
		yourself.
	^ BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		addChildren:
			{executedButton.
			notExecutedButton.
			notInstrumentedButton.
			instrumentedLabel.
			allLabel};
		yourself
]
