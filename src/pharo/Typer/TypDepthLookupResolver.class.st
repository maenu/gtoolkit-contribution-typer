Class {
	#name : #TypDepthLookupResolver,
	#superclass : #TypLookupResolver,
	#instVars : [
		'resolver'
	],
	#category : #'Typer-Core'
}

{ #category : #resolving }
TypDepthLookupResolver >> resolve: aLookup [
	^ (resolver resolve: aLookup)
		ifNil: [ aLookup hasSuperType
				ifTrue: [ (self resolve: aLookup copy adaptWithSuperType)
						ifNotNil: [ :e | 
							e
								lookup: aLookup;
								yourself ] ]
				ifFalse: [ nil ] ]
		ifNotNil: #yourself
]

{ #category : #accessing }
TypDepthLookupResolver >> resolver [
	^ resolver
]

{ #category : #accessing }
TypDepthLookupResolver >> resolver: anObject [
	resolver := anObject
]
