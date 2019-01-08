Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheColor [
	<typTypeResultAs: 'Color'>
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
	<typTypeResultAs: 'Boolean'>
	^ self typCheHasIncompatibleArguments
		or: [ self typCheHasIncompatibleAssignments
				or: [ self typCheHasIncompatibleReturns ] ]
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasIncompatibleArguments [
	<typTypeResultAs: 'Boolean'>
	((self allChildren select: #isMessage) reject: #isCascade) "typParameters RBMessageNode"
		do: [ :e | 
			e arguments
				withIndexDo: [ :f :i | 
					[ e typCheCheckArgumentCompatibilityAt: i ]
						on: TypCheIncompatibleTypeError
						do: [ ^ true ] ] ].
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasIncompatibleAssignments [
	<typTypeResultAs: 'Boolean'>
	(self allChildren select: #isAssignment) "typParameters RBAssignmentNode"
		do: [ :e | 
			[ e typCheCheckCompatibility ]
				on: TypCheIncompatibleTypeError
				do: [ ^ true ] ].
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasIncompatibleReturns [
	<typTypeResultAs: 'Boolean'>
	(self allChildren select: #isReturn) "typParameters RBReturnNode"
		do: [ :e | 
			[ e typCheCheckCompatibility ]
				on: TypCheIncompatibleTypeError
				do: [ ^ true ] ].
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasMissingMethods [
	<typTypeResultAs: 'Boolean'>
	((self allChildren select: #isMessage) reject: #isCascade) "typParameters RBMessageNode"
		do: [ :e | 
			[ e typCheCheckMethod ]
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
RBMethodNode >> typCheHasUnknownArguments [
	<typTypeResultAs: 'Boolean'>
	^ (self allChildren select: #isArgument) anySatisfy: [ :e | e typType isUnknown ]
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
RBMethodNode >> typCheHasUnknownReturn [
	<typTypeResultAs: 'Boolean'>
	^ self typTypeForResult isUnknown
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasUnknownTemporaries [
	<typTypeResultAs: 'Boolean'>
	^ (self allChildren select: [ :e | e isTemp and: [ e isArgument not and: [ (e "typCastAs RBTemporaryNode") typIsDeclaration ] ] ]) anySatisfy: [ :e | e typType isUnknown ]
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasUnknowns [
	<typTypeResultAs: 'Boolean'>
	^ self typCheHasUnknownArgumentsPassed or: [ self typCheHasUnknownReceivers or: [ self typCheHasUnknownReturn or: [ self typCheHasUnknownArguments or: [ self typCheHasUnknownTemporaries ] ] ] ]
]
