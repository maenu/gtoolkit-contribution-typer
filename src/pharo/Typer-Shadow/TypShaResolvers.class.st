Class {
	#name : #TypShaResolvers,
	#superclass : #TypResolver,
	#instVars : [
		'resolvers'
	],
	#category : #'Typer-Shadow-Core'
}

{ #category : #initialization }
TypShaResolvers >> initialize [
	<typTypeVariable: 'resolvers' as: 'Symbol<Character>'>
	super initialize
]

{ #category : #accessing }
TypShaResolvers >> resolversFor: aLookup shadowing: aClass [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeArgument: 2 as: 'ClassDescription'>
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypLookup>>'>
	^ (((TypShaShadow shadowClassesFor: aClass) flatCollect: resolvers) "typParameters TypResolver<TypResolver>"
		select: [ :e | e resolves: aLookup ])
		flatCollect: [ :e | e resolversFor: aLookup ]
]

{ #category : #accessing }
TypShaResolvers >> resolves: aLookup shadowing: aClass [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeArgument: 2 as: 'ClassDescription'>
	<typTypeResultAs: 'Boolean'>
	^ ((TypShaShadow shadowClassesFor: aClass) flatCollect: resolvers) "typParameters TypResolver<TypLookup>"
		anySatisfy: [ :e | e resolves: aLookup ]
]
