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
	^ (TypInfExaMethods >> #block:) ast typInfContextLookup result
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
		select: [ :m | m isInstalled and: [ m size < 100 ] ]) atRandom ast
		typInfContextLookup resultAsyncFor: 10 seconds
]

{ #category : #accessing }
TypInfManifest class >> signalContext [
	<gtExample>
	^ (TypInfExaMethods >> #signalAndHandle) ast typInfContextLookup result
]

{ #category : #accessing }
TypInfManifest class >> someRandomMethods [
	| all methods |
	all := Smalltalk globals allMethods.
	methods := IdentitySet new.
	[ methods size < 3 ] whileTrue: [ methods add: all atRandom ].
	^ methods
]
