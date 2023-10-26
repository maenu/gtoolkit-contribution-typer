Class {
	#name : #TypInfManifest,
	#superclass : #PackageManifest,
	#traits : 'TypTManifest',
	#classTraits : 'TypTManifest classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfManifest class >> asyncMethods [
	<gtExample>
	^ 'Typer' gtPackageMatches
		select: [ :m | m selector includesSubstring: 'async' caseSensitive: false ]
]

{ #category : #accessing }
TypInfManifest class >> build [
	TypInfIndex instance.
	TypInfConfiguration default.
]

{ #category : #accessing }
TypInfManifest class >> exampleContext [
	<gtExample>
	^ (TypInfExaMethods >> #block:) typInfContext
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
	TypInfNodeStack resetSoleInstance.
	TypInfConfiguration invalidate.
	TypInfCurrentConfiguration resetSoleInstance
]

{ #category : #accessing }
TypInfManifest class >> randomContext [
	<gtExample>
	^ (Smalltalk globals allMethods
		select: [ :m | m isInstalled and: [ m size < 100 ] ]) atRandom typInfContext
]

{ #category : #accessing }
TypInfManifest class >> signalContext [
	<gtExample>
	^ (TypInfExaMethods >> #signalAndHandle) typInfContext
]

{ #category : #accessing }
TypInfManifest class >> someRandomMethods [
	| all methods |
	all := Smalltalk globals allMethods.
	methods := IdentitySet new.
	[ methods size < 3 ] whileTrue: [ methods add: all atRandom ].
	^ methods
]

{ #category : #accessing }
TypInfManifest class >> updateAllContextsAsync [
	<gtExample>
	<noTest>
	^ CompiledMethod allInstances
		collect: [ :m | ^ TypInfIndex instance contextAsyncUpdateAt: m typInfAsLookup for: 5 seconds ]
]

{ #category : #accessing }
TypInfManifest class >> updateContextAsync: aMethod [
	^ TypInfIndex instance
		contextAsyncUpdateAt: aMethod typInfAsLookup
		for: 2 minutes
]

{ #category : #accessing }
TypInfManifest class >> updateRandomContextAsync [
	<gtExample>
	<noTest>
	^ TypInfIndex instance
		contextAsyncUpdateAt: self someRandomMethods anyOne typInfAsLookup
		for: 30 seconds
]

{ #category : #accessing }
TypInfManifest class >> updateSomeRandomContextsAsync [
	<gtExample>
	<noTest>
	^ self someRandomMethods
		collect: [ :m | ^ TypInfIndex instance contextAsyncUpdateAt: m typInfAsLookup for: 30 seconds ]
]
