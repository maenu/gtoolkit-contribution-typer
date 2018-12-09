Class {
	#name : #TypPraTypeResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Pragma-Core'
}

{ #category : #accessing }
TypPraTypeResolver >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypTypeResolver<TypTypeLookup>>'>
	| pragma |
	self assert: [ self resolves: aLookup ].
	pragma := (aLookup clazz methods detect: [ :e | e selector = #initialize ]) pragmas detect: [ :e | e selector = #typTypeParametersAs: ].
	^ {(TypTypeResolver new
		type: [ aLookup clazz typAsNamedType asParametricType: (pragma arguments at: 1) typAsTypes ];
		yourself)}
]

{ #category : #accessing }
TypPraTypeResolver >> resolves: aLookup [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeResultAs: 'Boolean'>
	^ aLookup clazz methods anySatisfy: [ :e | e selector = #initialize and: [ e pragmas anySatisfy: [ :f | f selector = #typTypeParametersAs: ] ] ]
]
