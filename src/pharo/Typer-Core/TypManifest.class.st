Class {
	#name : #TypManifest,
	#superclass : #PackageManifest,
	#category : #'Typer-Core-Core'
}

{ #category : #accessing }
TypManifest class >> allPackages [
	^ RPackageOrganizer default packages
		select: [ :e | e name beginsWith: 'Typer' ]
]

{ #category : #accessing }
TypManifest class >> buildAll [
	(self allPackages collect: #packageManifestOrNil)
		reject: #isNil
		thenDo: [ :c | (c class includesSelector: #build) ifTrue: [ c build ] ]
]

{ #category : #accessing }
TypManifest class >> canFindReferences [
	^ self canTallySpace
]

{ #category : #accessing }
TypManifest class >> canTallySpace [
	^ Smalltalk vm memorySize < (10 ** 9)
]

{ #category : #accessing }
TypManifest class >> checkVitals: aCollection start: aDateAndTime ifDead: aBlock [
	^ aCollection
		, (self
				ifDead: [ :t | 
					aBlock
						value: {t.
								Smalltalk vm statisticsReport.
								DateAndTime now - aDateAndTime} ]
				ifAlive: [ :t | {t} ]
				ifUnknown: [ #() ])
]

{ #category : #accessing }
TypManifest class >> declareAlive: aCollection start: aDateAndTime message: aString [
	^ aCollection
		, {Smalltalk vm statisticsReport.
				DateAndTime now - aDateAndTime.
				aString}
]

{ #category : #accessing }
TypManifest class >> flags [
	^ 'Typer' gtPackageMatches & #flag: gtSenders
]

{ #category : #accessing }
TypManifest class >> ifDead: aBlock ifAlive: anotherBlock ifUnknown: yetAnotherBlock [
	| tally |
	TypUnknownType instanceCount = 0 ifTrue: [ ^ aBlock cull: nil ].
	self canTallySpace ifFalse: [ ^ yetAnotherBlock value ].
	tally := self tallySpace.
	^ tally size <= 8
		ifTrue: [ aBlock cull: tally ]
		ifFalse: [ anotherBlock cull: tally ]
]

{ #category : #accessing }
TypManifest class >> invalidate [
	TypEdgeKey invalidateAll.
	TypIndex invalidateAll.
	TypNode invalidateAll
]

{ #category : #accessing }
TypManifest class >> invalidateAll [
	(self allPackages collect: #packageManifestOrNil)
		reject: #isNil
		thenDo: [ :c | (c class includesSelector: #invalidate) ifTrue: [ c invalidate ] ]
]

{ #category : #accessing }
TypManifest class >> isDead [
	^ self
		ifDead: true
		ifAlive: false
		ifUnknown: nil
]

{ #category : #accessing }
TypManifest class >> nilAll [
	(self allPackages collect: #packageManifestOrNil)
		reject: #isNil
		thenDo: [ :c | (c class includesSelector: #nil) ifTrue: [ c nil ] ]
]

{ #category : #accessing }
TypManifest class >> nuke [
	"nukes typer from memory.
	before calling you should close all tabs to get rid of references in coders etc.
	this takes minutes, but due to memory size checks should not take hours"

	<gtExample>
	<noTest>
	| start result |
	start := DateAndTime now.
	result := {}.
	self nilAll.
	self invalidateAll.
	result := self
			checkVitals: result
			start: start
			ifDead: [ :c | ^ c , {'success, one garbage collection did it'} ].
	self canFindReferences
		ifFalse: [ ^ self
				declareAlive: result
				start: start
				message: 'failure, more than 1GB and instantiated typer classes, #pointersTo and ReferenceFinder can help to find out who references it, but it is really slow for this gigabyte images. try closing all tabs and run this again. save, close, start may also help, but saving GB images can be slow' ].
	
	"somehow, calling ReferenceFinder and subsequent GC gets rid of more objects. sometimes"
	result last
		detect: [ :e | (e analyzedClassName beginsWith: 'TypGt') not ]
		ifFound: [ :e | 
			(ReferenceFinder findPathToInstanceOf: e analyzedClassName asClass)
				ifNotNil: [ :c | 
					^ self
						declareAlive: result , {c}
						start: start
						message: 'failure, strong paths found, break the found paths by nilling a reference in the right place' ] ].
	result := self
			checkVitals: result
			start: start
			ifDead: [ :c | ^ c , {'success, all gone after nudging garbage collection'} ].
	^ self
		declareAlive: result
		start: start
		message: 'failure, multiple garbage collections and tricks did not reduce instantiated classes to four gt classes, but could not find a reference to an instance of one of the non-gt ones. is the reference finder not finding all references due to some corner case?'
]

{ #category : #accessing }
TypManifest class >> recompileAll [
	(self allPackages flatCollect: #definedClasses) do: #recompile
]

{ #category : #accessing }
TypManifest class >> tallySpace [
	"system-wide seems to be faster than querying ~100 classes"

	<gtExample>
	<notTest>
	^ (SpaceTally new systemWideSpaceTally
		select: [ :e | e analyzedClassName beginsWith: 'Typ' ])
		sorted: [ :a :b | a instanceCount > b instanceCount ]
]

{ #category : #accessing }
TypManifest >> nil [
	"clean up undeclareds
	not sure how to reproduce
	the undeclared class instance variable was pointing to a value"
	
	SmalltalkImage cleanUp.
	Undeclared associations
		select: [ :a | a value class package name beginsWith: 'Typer' ]
		thenDo: [ :a | Undeclared removeKey: a key ]
]
