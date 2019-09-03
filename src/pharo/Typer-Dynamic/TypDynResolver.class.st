Class {
	#name : #TypDynResolver,
	#superclass : #TypResolver,
	#instVars : [
		'resolvers'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #accessing }
TypDynResolver >> initialize [
	<typTypeParametersAs: 'TypLookup'>
	<typTypeVariable: 'resolvers' as: 'Dictionary<Association<ClassDescription,Symbol<Character>>,TypResolver<TypObjectLookup>>'>
	super initialize.
	resolvers := Dictionary new "typParameters Association<ClassDescription,Symbol<Character>>,TypResolver<TypObjectLookup>"
]

{ #category : #accessing }
TypDynResolver >> resolvers [
	<typTypeResultAs: 'Dictionary<Association<ClassDescription,Symbol<Character>>,TypResolver<TypObjectLookup>>'>
	^ resolvers
]

{ #category : #accessing }
TypDynResolver >> resolvers: anObject [
	<typTypeArgument: 1 as: 'Dictionary<Association<ClassDescription,Symbol<Character>>,TypResolver<TypObjectLookup>>'>
	resolvers := anObject
]

{ #category : #accessing }
TypDynResolver >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypObjectLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypLookup>>'>
	aLookup receiverType representsClass
		ifFalse: [ ^ #() ].
	^ {(resolvers at: aLookup receiverType asClass -> aLookup selector)}
]
