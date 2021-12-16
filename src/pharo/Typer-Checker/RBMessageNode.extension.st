Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Checker' }
RBMessageNode >> typCheCheckArgumentCompatibilityAt: anInteger [

	<typPraArguments: 'Integer'>
	| argument expected actual |
	argument := self arguments at: anInteger.
	expected := self typInfMethodInSelf arguments at: anInteger.
	actual := argument typInfTypeInSelf.
	(expected isUnknown or: [ actual isUnknown ]) ifTrue: [ ^ self ].
	expected asNonNullable >= actual asNonNullable ifTrue: [ ^ self ].
	(actual isFunction and: [ 
		 actual result isUnknown or: [ 
			 argument isBlock and: [ 
				 argument typInfTypeInSelf signalsAlways = true or: [ 
					 argument body lastIsReturn ] ] ] ]) ifTrue: [ ^ self ].
	TypCheIncompatibleTypeError new
		expected: expected;
		actual: actual;
		signal
]

{ #category : #'*Typer-Checker' }
RBMessageNode >> typCheCheckMethod [

	| receiverType |
	receiverType := receiver typInfTypeInSelf.
	receiverType isUnknown ifTrue: [ ^ self ].
	(receiverType asNonNullable lookupMethod: selector value) isUnknown 
		ifFalse: [ ^ self ].
	TypCheNoMethodError new
		type: receiverType;
		selector: selector value;
		signal
]

{ #category : #'*Typer-Checker' }
RBMessageNode >> typCheCheckReceiver [

	| receiverType |
	receiverType := receiver typInfTypeInSelf.
	receiverType isUnknown ifTrue: [ ^ self ].
	(receiverType lookupMethod: self selector) isUnknown ifTrue: [ 
		^ self ].
	receiverType isNullable ifFalse: [ ^ self ].
	TypCheNullableTypeError new
		type: receiverType;
		signal
]
