Class {
	#name : #TypManifest,
	#superclass : #PackageManifest,
	#traits : 'TypTManifest',
	#classTraits : 'TypTManifest classTrait',
	#classInstVars : [
		'threadPool',
		'logger',
		'subscription'
	],
	#category : #'Typer-Core-Core'
}

{ #category : #accessing }
TypManifest class >> build [
	self flag: 'FIXME ensure build is called'.
	subscription := SystemAnnouncer uniqueInstance
			when: ClassAnnouncement , MethodAnnouncement
			do: [ [ :e | [ e typInvalidateAll ] typAsAsyncFuture typAwait ] ]
]

{ #category : #accessing }
TypManifest class >> buildAll [
	self manifests do: #build
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
	subscription ifNotNil: [ subscription announcer unsubscribe: subscription ].
	subscription := nil.
	threadPool ifNotNil: #shutdown.
	threadPool := nil.
	logger ifNotNil: #stop.
	logger ifNotNil: #reset.
	logger := nil.
	TypLookup invalidateAll.
	TypIndex invalidateAll.
	TypNode invalidateAll.
	TypCoverage invalidate
]

{ #category : #accessing }
TypManifest class >> invalidateAll [
	self manifests do: #invalidate
]

{ #category : #accessing }
TypManifest class >> isDead [
	^ self
		ifDead: true
		ifAlive: false
		ifUnknown: nil
]

{ #category : #accessing }
TypManifest class >> logger [
	<gtExample>
	<noTest>
	self flag: 'TODO remove gt dep by class-side gt conf'.
	^ logger
		ifNil: [ logger := TypInfMemoryLogger new
					startFor: TypInfNodeSignal , GtStylerErrorSignal;
					yourself ]
]

{ #category : #accessing }
TypManifest class >> manifests [
	^ (self packages collect: #packageManifestOrNil) reject: #isNil
]

{ #category : #accessing }
TypManifest class >> nilAll [
	self manifests do: #nil
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
	| start report |
	start := DateAndTime now.
	report := OrderedCollection new.
	self invalidateAll.
	self nilAll.
	Smalltalk garbageCollectMost.
	self
		checkVitals: report
		start: start
		message: 'success, garbage collection did it'
		ifDead: [ ^ report ].
	[ ReferenceFinder
		findPathToInstanceOf: report last atRandom analyzedClassName asClass ]
		typRunAtMost: 1 minute
		onCompletion: [ :r :e | 
			r
				ifNotNil: [ report add: r.
					^ self
						declareAlive: report
						start: start
						message: 'failure, strong paths found, break the found paths by nilling a reference in the right place' ] ]
		onTimeout: [ report add: 'terminated ReferenceFinder after 1 minute' ].
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
TypManifest class >> packages [
	^ RPackageOrganizer default packages
		select: [ :e | e name beginsWith: 'Typer' ]
]

{ #category : #accessing }
TypManifest class >> recompileAll [
	(self packages flatCollect: #definedClasses) do: #recompile
]

{ #category : #accessing }
TypManifest class >> tallySpace [
	"system-wide seems to be faster than querying ~100 classes"

	<gtExample>
	<noTest>
	"^ ((SpaceTally new spaceTally: (self packages flatCollect: #definedClasses)) items
		select: [ :e | e analyzedClassName beginsWith: 'Typ' ])
		sorted: [ :a :b | a instanceCount > b instanceCount ]"
	^ (SpaceTally new systemWideSpaceTally
		select: [ :e | e analyzedClassName beginsWith: 'Typ' ])
		sorted: [ :a :b | a instanceCount > b instanceCount ]
]

{ #category : #accessing }
TypManifest class >> threadPool [
	^ threadPool
		ifNil: [ threadPool := AsyncFutureThreadPool new
					typMaxWorkers: 1;
					yourself ]
]
