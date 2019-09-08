Class {
	#name : #TypDynLookupResolver,
	#superclass : #TypLookupResolver,
	#instVars : [
		'resolvers'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #accessing }
TypDynLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypObjectLookup'>
	<typTypeResultAs: '!TypResolver<TypObjectLookup>'>
	^ aLookup receiverType representsClass
		ifTrue: [ resolvers
				at: aLookup receiverType asClass -> aLookup selector
				ifPresent: [ :e | e resolve: aLookup ]
				ifAbsent: [ nil ] ]
		ifFalse: [ nil ]
]

{ #category : #accessing }
TypDynLookupResolver >> resolvers [
	<typTypeResultAs: 'Dictionary<Association<ClassDescription,Symbol<Character>>,TypResolver<TypObjectLookup>>'>
	^ resolvers
]

{ #category : #accessing }
TypDynLookupResolver >> resolvers: anObject [
	<typTypeArgument: 1 as: 'Dictionary<Association<ClassDescription,Symbol<Character>>,TypResolver<TypObjectLookup>>'>
	resolvers := anObject
]
