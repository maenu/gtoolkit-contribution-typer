Class {
	#name : #TypPraVariableResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Pragma-Core'
}

{ #category : #initialization }
TypPraVariableResolver >> initialize [
	<typTypeParametersAs: 'TypVariableLookup'>
	super initialize
]

{ #category : #accessing }
TypPraVariableResolver >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypVariableResolver<TypVariableLookup>>'>
	| pragma |
	self assert: [ self resolves: aLookup ].
	pragma := (aLookup receiverType asClass methods
		detect: [ :e | e selector = #initialize ]) pragmas
		detect: [ :e | 
			e selector = #typTypeVariable:as:
				and: [ e arguments first = aLookup selector ] ].
	^ {(TypVariableResolver new
		type: [ (pragma arguments at: 2) typAsType ];
		yourself)}
]

{ #category : #accessing }
TypPraVariableResolver >> resolves: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'Boolean'>
	aLookup receiverType representsClass
		ifFalse: [ ^ false ].
	^ aLookup receiverType asClass methods anySatisfy: [ :e | e selector = #initialize and: [ e pragmas anySatisfy: [ :f | f selector = #typTypeVariable:as: and: [ f arguments first = aLookup selector ] ] ] ]
]
