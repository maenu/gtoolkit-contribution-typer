Class {
	#name : #TypInfManifest,
	#superclass : #PackageManifest,
	#traits : 'TypTManifest',
	#classTraits : 'TypTManifest classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfManifest class >> build [
	TypInfIndex instance
]

{ #category : #accessing }
TypInfManifest class >> exampleMethods [
	<gtExample>
	^ GtPharoMethodsCoder forItems: TypInfExaMethods methods
]

{ #category : #accessing }
TypInfManifest class >> findPathToIndex [
	^ ReferenceFinder findPathToInstanceOf: TypInfIndex
]

{ #category : #accessing }
TypInfManifest class >> invalidate [
	TypInfIndex invalidate.
	TypInfNodeStack resetSoleInstance
]

{ #category : #accessing }
TypInfManifest class >> someRandomMethods [
	| all methods |
	all := CompiledMethod allInstances.
	methods := IdentitySet new.
	[ methods size < 3 ] whileTrue: [ methods add: all atRandom ].
	^ methods
]

{ #category : #accessing }
TypInfManifest class >> updateAllContextsAsync [
	<gtExample>
	<noTest>
	^ CompiledMethod allInstances
		collect: [ :m | 
			^ TypInfIndex instance
				updateContextAsync: m typInfAsLookup
				by: #run
				for: 5 seconds ]
]

{ #category : #accessing }
TypInfManifest class >> updateAllContextsAsyncWithTally [
	<gtExample>
	<noTest>
	^ CompiledMethod allInstances
		collect: [ :m | 
			^ TypInfIndex instance
				updateContextAsync: m typInfAsLookup
				by: #run
				for: 5 seconds ]
]

{ #category : #accessing }
TypInfManifest class >> updateContextAsync: aMethod [
	^ TypInfIndex instance
		updateContextAsync: aMethod typInfAsLookup
		by: #run
		for: 2 minutes
]

{ #category : #accessing }
TypInfManifest class >> updateRandomContextAsync [
	<gtExample>
	<noTest>
	^ TypInfIndex instance
		updateContextAsync: self someRandomMethods anyOne typInfAsLookup
		by: #run
		for: 30 seconds
]

{ #category : #accessing }
TypInfManifest class >> updateRandomContextAsyncWithTally [
	<gtExample>
	<noTest>
	^ TypInfIndex instance
		updateContextAsyncWithTally: self someRandomMethods anyOne typInfAsLookup
		by: #run
		for: 3 seconds
]

{ #category : #accessing }
TypInfManifest class >> updateSomeRandomContextsAsync [
	<gtExample>
	<noTest>
	^ self someRandomMethods
		collect: [ :m | 
			^ TypInfIndex instance
				updateContextAsync: m typInfAsLookup
				by: #run
				for: 30 seconds ]
]

{ #category : #accessing }
TypInfManifest class >> updateSomeRandomContextsAsyncWithTally [
	<gtExample>
	<noTest>
	^ self someRandomMethods
		collect: [ :m | 
			^ TypInfIndex instance
				updateContextAsyncWithTally: m typInfAsLookup
				by: #run
				for: 30 seconds ]
]
