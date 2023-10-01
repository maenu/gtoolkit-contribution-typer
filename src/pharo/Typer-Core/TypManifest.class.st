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
	^ Smalltalk vm memorySize < (10 ** 9)
]

{ #category : #accessing }
TypManifest class >> canTallySpace [
	^ Smalltalk vm memorySize < (4 * 10 ** 9)
]

{ #category : #accessing }
TypManifest class >> checkVitals: aCollection start: aDateAndTime message: aString ifDead: aBlock [
	self
		ifDead: [ :t | 
			aCollection
				add: t;
				add: Smalltalk vm statisticsReport;
				add: DateAndTime now - aDateAndTime;
				add: aString.
			aBlock value ]
		ifAlive: [ :t | aCollection add: t ]
		ifUnknown: [  "noop" ].
	^ aCollection
]

{ #category : #accessing }
TypManifest class >> declareAlive: aCollection start: aDateAndTime message: aString [
	^ aCollection
		add: Smalltalk vm statisticsReport;
		add: DateAndTime now - aDateAndTime;
		add: aString;
		yourself
]

{ #category : #accessing }
TypManifest class >> flags [
	^ 'Typer' gtPackageMatches & #flag: gtSenders
]

{ #category : #accessing }
TypManifest class >> ifDead: aBlock ifAlive: anotherBlock ifUnknown: yetAnotherBlock [
	| tally |
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
	this takes minutes, but due to memory size checks should not take hours
	
	failure, more than 1GB and instantiated typer classes, #pointersTo and ReferenceFinder can help to find out who references it, but it is really slow for this gigabyte images. try closing all tabs and run this again. save, close, start may also help, but saving GB images can be slow
	
	somehow, calling ReferenceFinder seems to nudge GC
	
	is the reference finder not finding all references due to some corner case?"

	<gtExample>
	<noTest>
	| start report paths found find |
	start := DateAndTime now.
	report := OrderedCollection new.
	self nilAll.
	self invalidateAll.
	Smalltalk garbageCollectMost.
	self
		checkVitals: report
		start: start
		message: 'success, garbage collection did it'
		ifDead: [ ^ report ].
	found := Semaphore new.
	find := [ (ReferenceFinder
			findPathToInstanceOf: report last anyOne analyzedClassName asClass)
			ifNotNil: [ :c | 
				paths := c.
				found signal ] ] fork.
	found
		wait: 1 minute
		onCompletion: [ report add: paths.
			^ self
				declareAlive: report
				start: start
				message: 'failure, strong paths found, break the found paths by nilling a reference in the right place' ]
		onTimeout: [ find terminate ].
	self
		checkVitals: report
		start: start
		message: 'success, all gone after nudging garbage collection'
		ifDead: [ ^ report ].
	^ self
		declareAlive: report
		start: start
		message: 'failure, multiple garbage collections and tricks did not reduce instantiated typer classes, but could not find a reference to an instance quickly'
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
