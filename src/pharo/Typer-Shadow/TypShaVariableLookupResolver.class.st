Class {
	#name : #TypShaVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaVariableLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: '!TypVariableResolver<TypVariableLookup>'>
	^ aLookup receiverType representsClass
		ifTrue: [ ((aLookup receiverType asClass typShaShadows
				collect: [ :e | e asVariableLookupResultFor: aLookup selector ])
				reject: #isNil)
				ifEmpty: [ nil ]
				ifNotEmpty: [ :f | 
					f first copy
						lookup: aLookup;
						resolvedBy: aLookup;
						resolver: self;
						yourself ] ]
		ifFalse: [ nil ]
]
