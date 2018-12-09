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
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeArgument: 2 as: 'ClassDescription'>
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypMethodLookup>>'>
	^ (((TypShaShadow shadowClassesFor: aClass) flatCollect: resolvers)
		select: [ :e | e resolves: aLookup ])
		flatCollect: [ :e | e resolversFor: aLookup ]
]

{ #category : #'as yet unclassified' }
TypShaResolvers >> resolves: aLookup shadowing: aClass [
	^ ((TypShaShadow shadowClassesFor: aClass) flatCollect: resolvers) anySatisfy: [ :e | e resolves: aLookup ]
]
