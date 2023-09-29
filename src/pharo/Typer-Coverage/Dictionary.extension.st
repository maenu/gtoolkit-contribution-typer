Extension { #name : #Dictionary }

{ #category : #'*Typer-Coverage' }
Dictionary >> typGtCovAsElement [
	| executed notExecuted notInstrumented executedButton notExecutedButton notInstrumentedButton instrumentedLabel allLabel |
	executed := self at: true ifAbsent: [ #() ].
	notExecuted := self at: false ifAbsent: [ #() ].
	notInstrumented := self at: nil ifAbsent: [ #() ].
	executedButton := BrButton new
		aptitude: BrGlamorousButtonWithLabelAptitude;
		label: executed size asString , ' executed';
		action: [ :e | e phlow spawnObject: executed ];
		yourself.
	notExecutedButton := BrButton new
		aptitude: BrGlamorousButtonWithLabelAptitude;
		label: notExecuted size asString , ' not executed';
		action: [ :e | e phlow spawnObject: notExecuted ];
		yourself.
	notInstrumentedButton := BrButton new
		aptitude: BrGlamorousButtonWithLabelAptitude;
		label: notInstrumented size asString , ' not instrumented';
		action: [ :e | e phlow spawnObject: notInstrumented ];
		yourself.
	instrumentedLabel := BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		text:
			(([ 100 * executed size / (executed size + notExecuted size) ]
				on: ZeroDivide
				do: [ 0 ]) asFloat round: 2) asString
				, '% coverage of instrumented';
		yourself.
	allLabel := BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		text:
			(([ 100 * executed size
				/ (executed size + notExecuted size + notInstrumented size) ]
				on: ZeroDivide
				do: [ 0 ]) asFloat round: 2) asString , '% coverage of all';
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
