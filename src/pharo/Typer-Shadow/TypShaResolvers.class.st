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
	^ (((self shadowClassesFor: aClass) flatCollect: resolvers) select: [ :e | e resolves: aLookup ]) flatCollect: [ :e | e resolversFor: aLookup ]
]

{ #category : #'as yet unclassified' }
TypShaResolvers >> resolves: aLookup shadowing: aClass [
	^ ((self shadowClassesFor: aClass) flatCollect: resolvers) anySatisfy: [ :e | e resolves: aLookup ]
]

{ #category : #'as yet unclassified' }
TypShaResolvers >> shadowClassesFor: aClass [
	^ TypShaShadow allSubclasses select: [ :e | e shadowedClass == aClass classSide ]
]
