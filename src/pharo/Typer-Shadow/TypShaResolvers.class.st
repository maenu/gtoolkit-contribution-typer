Class {
	#name : #TypShaResolvers,
	#superclass : #TypResolver,
	#instVars : [
		'resolvers'
	],
	#category : #'Typer-Shadow-Core'
}

{ #category : #'as yet unclassified' }
TypShaResolvers >> resolversFor: aLookup shadowing: aClass [
	^ (((TypShaShadow shadowClassesFor: aClass) flatCollect: resolvers) select: [ :e | e resolves: aLookup ]) flatCollect: [ :e | e resolversFor: aLookup ]
]

{ #category : #'as yet unclassified' }
TypShaResolvers >> resolves: aLookup shadowing: aClass [
	^ ((TypShaShadow shadowClassesFor: aClass) flatCollect: resolvers) anySatisfy: [ :e | e resolves: aLookup ]
]
