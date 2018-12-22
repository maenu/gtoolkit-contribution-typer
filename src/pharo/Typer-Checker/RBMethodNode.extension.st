Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheColor [
	<typTypeResultAs: 'Color'>
	self typCheHasIncompatibilities
		ifTrue: [ ^ Color red ].
	self typCheHasMissingMethods
		ifTrue: [ ^ Color orange ].
	self typCheHasNullables
		ifTrue: [ ^ Color purple ].
	self typCheHasUnknowns
		ifTrue: [ ^ Color blue ].
	^ Color green
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasIncompatibilities [
	<typTypeResultAs: 'Boolean'>
	^ self typCheHasIncompatibleArguments
		or: [ self typCheHasIncompatibleAssignments
				or: [ self typCheHasIncompatibleReturns ] ]
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasIncompatibleArguments [
	<typTypeResultAs: 'Boolean'>
	((self allChildren select: #isMessage) reject: #isCascade)
		do: [ :e | 
			(e "typCastAs RBMessageNode") arguments
				withIndexDo: [ :f :i | 
					[ [ (e "typCastAs RBMessageNode") typCheCheckArgumentCompatibilityAt: i ]
						on: TypCheNullableTypeError
						do: [  ] ]
						on: TypCheIncompatibleTypeError
						do: [ ^ true ] ] ].
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasIncompatibleAssignments [
	<typTypeResultAs: 'Boolean'>
	(self allChildren select: #isAssignment)
		do: [ :e | 
			[ (e "typCastAs RBAssignmentNode") typCheCheckCompatibility ]
				on: TypCheIncompatibleTypeError
				do: [ ^ true ] ].
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasIncompatibleReturns [
	<typTypeResultAs: 'Boolean'>
	(self allChildren select: #isReturn)
		do: [ :e | 
			[ (e "typCastAs RBReturnNode") typCheCheckCompatibility ]
				on: TypCheIncompatibleTypeError
				do: [ ^ true ] ].
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasMissingMethods [
	<typTypeResultAs: 'Boolean'>
	((self allChildren select: #isMessage) reject: #isCascade)
		do: [ :e | 
			[ (e "typCastAs RBMessageNode") typCheCheckMethod ]
				on: TypCheNoMethodError
				do: [ ^ true ] ].
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasNullableArguments [
	<typTypeResultAs: 'Boolean'>
	^ ((((self allChildren select: #isMessage) reject: #isCascade) "typParameters RBMessageNode" flatCollect: #arguments) select: [ :e | e typType nullable ])
		anySatisfy: [ :e | 
			| e_ i expected actual |
			e_ := (e parent) "typCastAs RBMessageNode".
			i := e_ arguments detectIndex: [ :f | f == e ].
			expected := e_ typTypeForArgumentAt: i.
			actual := e typType.
			(expected >= actual) not and: [ expected >= actual asNonNullableType ] ]
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasNullableReceivers [
	<typTypeResultAs: 'Boolean'>
	^ ((self allChildren select: #isMessage) reject: #isCascade) "typParameters RBMessageNode" anySatisfy: [ :e | e receiver typType nullable ]
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasNullables [
	<typTypeResultAs: 'Boolean'>
	^ self typCheHasNullableReceivers or: [ self typCheHasNullableArguments ]
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasUnknownArgumentsPassed [
	<typTypeResultAs: 'Boolean'>
	((self allChildren select: #isMessage) reject: #isCascade) "typParameters RBMessageNode"
		do: [ :e | 
			e arguments
				withIndexDo: [ :f :i | 
					(e typTypeForArgumentAt: i) isUnknown
						ifTrue: [ ^ true ] ] ].
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasUnknownReceivers [
	<typTypeResultAs: 'Boolean'>
	^ ((self allChildren select: #isMessage) reject: #isCascade) "typParameters RBMessageNode" anySatisfy: [ :e | e receiver typType isUnknown ]
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasUnknowns [
	<typTypeResultAs: 'Boolean'>
	^ self typCheHasUnknownArgumentsPassed or: [ self typCheHasUnknownReceivers ]
]
