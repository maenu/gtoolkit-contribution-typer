Class {
	#name : #TypShaMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaMethodLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: '!TypMethodLookupResult'>
	^ aLookup receiverType representsClass
		ifTrue: [ ((aLookup receiverType asClass typShaShadows
				collect: [ :e | e asMethodLookupResultFor: aLookup selector ])
				reject: #isNil)
				ifEmpty: [ nil ]
				ifNotEmpty: [ :f | 
					f first
						lookup: aLookup;
						resolvedBy: aLookup;
						resolver: self;
						yourself ] ]
		ifFalse: [ nil ]
]
