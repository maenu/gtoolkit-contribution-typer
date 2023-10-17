Class {
	#name : #TypInfManifest,
	#superclass : #PackageManifest,
	#traits : 'TypTManifest',
	#classTraits : 'TypTManifest classTrait',
	#classInstVars : [
		'logger'
	],
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
	TypInfIndex instance
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
	logger ifNotNil: #stop.
	logger ifNotNil: #reset.
	logger := nil.
	TypInfIndex invalidate.
	TypInfNodeStack resetSoleInstance
]

{ #category : #accessing }
TypInfManifest class >> logger [
	<gtExample>
	<noTest>
	self flag: 'TODO remove gt dep by class-side gt conf'.
	^ logger
		ifNil: [ logger := TypInfMemoryLogger new
					startFor: TypInfNodeSignal , GtStylerErrorSignal;
					yourself ]
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
		collect: [ :m | 
			^ TypInfIndex instance
				asyncUpdateContextAt: m typInfAsLookup
				ifNew: #run
				for: 5 seconds ]
]

{ #category : #accessing }
TypInfManifest class >> updateAllContextsAsyncWithTally [
	<gtExample>
	<noTest>
	^ CompiledMethod allInstances
		collect: [ :m | 
			^ TypInfIndex instance
				asyncUpdateContextAt: m typInfAsLookup
				ifNew: #run
				for: 5 seconds ]
]

{ #category : #accessing }
TypInfManifest class >> updateContextAsync: aMethod [
	^ TypInfIndex instance
		asyncUpdateContextAt: aMethod typInfAsLookup
		ifNew: #run
		for: 2 minutes
]

{ #category : #accessing }
TypInfManifest class >> updateRandomContextAsync [
	<gtExample>
	<noTest>
	^ TypInfIndex instance
		asyncUpdateContextAt: self someRandomMethods anyOne typInfAsLookup
		ifNew: #run
		for: 30 seconds
]

{ #category : #accessing }
TypInfManifest class >> updateRandomContextWithTallyAsync [
	<gtExample>
	<noTest>
	^ TypInfIndex instance
		asyncWithTallyUpdateContextAt: self someRandomMethods anyOne typInfAsLookup
		ifNew: #run
		for: 3 seconds
]

{ #category : #accessing }
TypInfManifest class >> updateSomeRandomContextsAsync [
	<gtExample>
	<noTest>
	^ self someRandomMethods
		collect: [ :m | 
			^ TypInfIndex instance
				asyncUpdateContextAt: m typInfAsLookup
				ifNew: #run
				for: 30 seconds ]
]

{ #category : #accessing }
TypInfManifest class >> updateSomeRandomContextsWithTallyAsync [
	<gtExample>
	<noTest>
	^ self someRandomMethods
		collect: [ :m | 
			^ TypInfIndex instance
				asyncWithTallyUpdateContextAt: m typInfAsLookup
				ifNew: #run
				for: 30 seconds ]
]
