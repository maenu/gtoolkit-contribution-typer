Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheColor [
	<typPraResult: 'Color'>
	self typCheHasIncompatibilities
		ifTrue: [ ^ Color red ].
	self typCheHasMissingMethods
		ifTrue: [ ^ Color orange ].
	self typCheHasUnknowns
		ifTrue: [ ^ Color blue ].
	self typCheHasNullables
		ifTrue: [ ^ Color purple ].
	^ Color green
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasIncompatibilities [
	<typPraResult: 'Boolean'>
	^ self typCheHasIncompatibleArguments
		or: [ self typCheHasIncompatibleAssignments
				or: [ self typCheHasIncompatibleReturns ] ]
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasIncompatibleArguments [
	<typPraResult: 'Boolean'>
	((self allChildren select: #isMessage) reject: #isCascade)
		do: [ :e | 
			e arguments
				withIndexDo: [ :f :i | 
					[ e typCheCheckArgumentCompatibilityAt: i ]
						on: TypCheIncompatibleTypeError
						do: [ :g | 
							g traceCr.
							^ true ] ] ].	"typParameters RBMessageNode"
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasIncompatibleAssignments [
	<typPraResult: 'Boolean'>
	(self allChildren select: #isAssignment)
		do: [ :e | 
			[ e typCheCheckCompatibility ]
				on: TypCheIncompatibleTypeError
				do: [ ^ true ] ].	"typParameters RBAssignmentNode"
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasIncompatibleReturns [
	<typPraResult: 'Boolean'>
	(self allChildren select: #isReturn)
		do: [ :e | 
			[ e typCheCheckCompatibility ]
				on: TypCheIncompatibleTypeError
				do: [ ^ true ] ].	"typParameters RBReturnNode"
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasMissingMethods [
	<typPraResult: 'Boolean'>
	((self allChildren select: #isMessage) reject: #isCascade)
		do: [ :e | 
			[ e typCheCheckMethod ]
				on: TypCheNoMethodError
				do: [ ^ true ] ].	"typParameters RBMessageNode"
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasNullableArguments [
	<typPraResult: 'Boolean'>
	^ ((((self allChildren select: #isMessage) reject: #isCascade)
		flatCollect: #arguments) select: [ :e | e typInfType isNullable ])
		anySatisfy: [ :e | 
			| e_ i expected actual |
			e_ := e parent.	"typCastAs RBMessageNode"
			i := e_ arguments detectIndex: [ :f | f == e ].
			expected := e_ typInfMethod argumentAt: i.
			actual := e typInfType.
			(expected >= actual) not and: [ expected >= actual asNonNullable ] ]	"typParameters RBMessageNode"
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasNullableReceivers [
	<typPraResult: 'Boolean'>
	^ ((self allChildren select: #isMessage) reject: #isCascade)
		anySatisfy: [ :e | 
			e receiver typInfType isNullable
				and: [ (e receiver typInfType canUnderstand: e selector) not ] ]	"typParameters RBMessageNode"
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasNullableReturns [
	<typPraResult: 'Boolean'>
	^ (self allChildren select: #isReturn)
		anySatisfy: [ :e"typCastAs RBReturnNode"
			 | 
			[ e typCheCheckNullables.
			false ]
				on: TypCheNullableTypeError
				do: [ true ] ]
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasNullables [
	<typPraResult: 'Boolean'>
	^ self typCheHasNullableReceivers
		or: [ self typCheHasNullableArguments
				or: [ self typCheHasNullableReturns ] ]
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasUnknownArguments [
	<typPraResult: 'Boolean'>
	1 to: self numArgs do: [ :e | 
		(self typInfMethod argumentAt: e) isUnknown
			ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasUnknownArgumentsPassed [
	<typPraResult: 'Boolean'>
	((self allChildren select: #isMessage) reject: #isCascade)
		do: [ :e | 
			e arguments
				withIndexDo: [ :f :i | 
					(e typInfMethod argumentAt: i) isUnknown
						ifTrue: [ ^ true ] ] ].	"typParameters RBMessageNode"
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasUnknownReceivers [
	<typPraResult: 'Boolean'>
	^ ((self allChildren select: #isMessage) reject: #isCascade)
		anySatisfy: [ :e | e receiver typInfType isUnknown ]	"typParameters RBMessageNode"
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasUnknownResult [
	<typPraResult: 'Boolean'>
	^ self typInfMethod result isUnknown
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasUnknownTemporaries [
	<typPraResult: 'Boolean'>
	^ (self allChildren
		select: [ :e | 
			e isTemp
				and:
					[ e isArgument not and: [ e isDefinition	"typCastAs RBTemporaryNode" ] ] ])
		anySatisfy: [ :e | e typInfType isUnknown ]
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasUnknowns [
	<typPraResult: 'Boolean'>
	^ self typCheHasUnknownArgumentsPassed
		or: [ self typCheHasUnknownReceivers
				or: [ self typCheHasUnknownResult
						or: [ self typCheHasUnknownArguments
								or: [ self typCheHasUnknownTemporaries ] ] ] ]
]
