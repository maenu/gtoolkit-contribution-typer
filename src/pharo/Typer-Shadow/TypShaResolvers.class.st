Class {
	#name : #TypShaResolvers,
	#superclass : #TypResolver,
	#instVars : [
		'resolvers',
		'cache'
	],
	#category : #'Typer-Shadow-Core'
}

{ #category : #initialization }
TypShaResolvers >> initialize [
	<typTypeVariable: 'resolvers' as: 'Symbol<Character>'>
	<typTypeVariable: 'resolversChache' as: 'Dictionary<String<Character>,SequenceableCollection<TypResolver<TypLookup>>>'>
	super initialize.
	self flag: 'FIXME invalidate on class add/remove'.
	cache := Dictionary new
]

{ #category : #accessing }
TypShaResolvers >> resolversFor: aLookup shadowing: aClass [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeArgument: 2 as: 'ClassDescription'>
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypLookup>>'>
	^ ((self resolversForShadowing: aClass)
		select: [ :e | e resolves: aLookup ])
		flatCollect: [ :e | (e resolversFor: aLookup) "typParameters TypResolver<TypLookup>" ]
]

{ #category : #accessing }
TypShaResolvers >> resolversForShadowing: aClass [
	^ cache
		at: aClass name
		ifAbsentPut:
			[ (TypShaShadow shadowClassesFor: aClass) flatCollect: resolvers	"typParameters TypResolver<TypLookup>" ]
]

{ #category : #accessing }
TypShaResolvers >> resolves: aLookup shadowing: aClass [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeArgument: 2 as: 'ClassDescription'>
	<typTypeResultAs: 'Boolean'>
	^ (self resolversForShadowing: aClass)
		anySatisfy: [ :e | e resolves: aLookup ]
]
